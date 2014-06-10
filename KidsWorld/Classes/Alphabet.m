//
//  Alphabet.m
//  BezierDrawing
//
//  Created by Pradnya Mankar on 08/10/12.
//  Copyright (c) 2012 Pradnya Mankar. All rights reserved.
//

#import "Alphabet.h"

@interface Alphabet ()


@end


@implementation Alphabet

@synthesize alphabetChar, alphabetPath;
@synthesize step1Completed, step2Completed, step3Completed, step4Completed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
//        [self setUserInteractionEnabled:YES];
    }
    return self;
}

#pragma mark - Capital letters

#pragma mark - A

+ (UIBezierPath *) pathForUppercaseA
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(80.0, 215.0)];
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(240.0, 215.0)];
    [aPath moveToPoint:CGPointMake(110.0, 155.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 155.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForA1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(80.0, 215.0)];
    return aPath;
}

- (BOOL) isA1Completed:(UIBezierPath *)path {

    if( [path containsPoint:CGPointMake(160.0, 45.0)] &&
       [path containsPoint:CGPointMake(80.0, 215.0)] &&
       [path containsPoint:CGPointMake(110.0, 155.0)] &&
       [path containsPoint:CGPointMake(135.0, 95.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForA2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(240.0, 215.0)];
    return aPath;
}

- (BOOL) isA2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 45.0)] &&
       [path containsPoint:CGPointMake(240.0, 215.0)] &&
       [path containsPoint:CGPointMake(210.0, 155.0)] &&
       [path containsPoint:CGPointMake(185.0, 95.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForA3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 155.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 155.0)];
    return aPath;
}

- (BOOL) isA3Completed:(UIBezierPath *)path {
    NSLog(@"isA3Completed method : %@", path);
    
    if( [path containsPoint:CGPointMake(159.0, 155.0)] &&
       [path containsPoint:CGPointMake(110.0, 155.0)] &&
       [path containsPoint:CGPointMake(210.0, 155.0)] )    {
        NSLog(@"isA3Completed");
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseA:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    NSLog(@"checkPathForUppercaseA: %@", path);
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [[UIBezierPath bezierPathWithCGPath:cgPath] retain];
    
    if( [self isA1Completed:path] && [self isA2Completed:path] && [self isA3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - B
+ (UIBezierPath *) pathForUppercaseB
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(160, 87.5)
                      radius:42.5
                  startAngle:DEGREES_TO_RADIANS(270)
                    endAngle:DEGREES_TO_RADIANS(90)
                   clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(120.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 130.0)];
    
    [aPath addArcWithCenter:CGPointMake(168, 171.5)
                     radius:43
                 startAngle:DEGREES_TO_RADIANS(280)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(120.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(168.0, 215.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForB1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 215.0)];
    return aPath;
}

- (BOOL) isB1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
       [path containsPoint:CGPointMake(120.0, 87.5)] &&
       [path containsPoint:CGPointMake(120.0, 130.0)] &&
       [path containsPoint:CGPointMake(120.0, 171.5)] &&
       [path containsPoint:CGPointMake(120.0, 215.0)] )    {
        NSLog(@"B1 completed");
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForB2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(160, 87.5)
                     radius:42.5
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(160.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 130.0)];
    return aPath;
}

- (BOOL) isB2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
       [path containsPoint:CGPointMake(160.0, 45.0)] &&
       [path containsPoint:CGPointMake(202.5, 87.5)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] &&
       [path containsPoint:CGPointMake(120.0, 130.0)])    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForB3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 130.0)];
    
    [aPath addArcWithCenter:CGPointMake(168, 171.5)
                     radius:43
                 startAngle:DEGREES_TO_RADIANS(280)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(168.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 215.0)];
    return aPath;
}

- (BOOL) isB3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] &&
       [path containsPoint:CGPointMake(211.0, 171.5)] &&
       [path containsPoint:CGPointMake(168.0, 215.0)] &&
       [path containsPoint:CGPointMake(120.0, 130.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseB:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    /*if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
     [path containsPoint:CGPointMake(120.0, 87.5)] &&
     [path containsPoint:CGPointMake(120.0, 130.0)] &&
     [path containsPoint:CGPointMake(120.0, 171.5)] &&
     [path containsPoint:CGPointMake(120.0, 215.0)] &&
     [path containsPoint:CGPointMake(160.0, 45.0)] &&
     [path containsPoint:CGPointMake(202.5, 87.5)] &&
     [path containsPoint:CGPointMake(160.0, 130.0)] &&
     [path containsPoint:CGPointMake(211.0, 171.5)] &&
     [path containsPoint:CGPointMake(168.0, 215.0)] )    {
     
     isPathFollowed = YES;
     }*/
    if( [self isB1Completed:path] && [self isB2Completed:path] && [self isB3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - C

+ (UIBezierPath *) pathForUppercaseC
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(155.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(163.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(155.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseC:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(203.81, 68.69)] &&
       [path containsPoint:CGPointMake(155.0, 50.0)] &&
       [path containsPoint:CGPointMake(108, 68.69)] &&
       [path containsPoint:CGPointMake(80.5, 130.0)] &&
       [path containsPoint:CGPointMake(108, 190)] &&
       [path containsPoint:CGPointMake(155.0, 210.0)] &&
       [path containsPoint:CGPointMake(203.81, 190.0)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - D

+ (UIBezierPath *) pathForUppercaseD
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(140.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(155.0, 115.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(310)
                  clockwise:YES];
    [aPath addArcWithCenter:CGPointMake(140.0, 130.0)
                     radius:91
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:YES];
    [aPath addArcWithCenter:CGPointMake(155.0, 145.0)
                     radius:69.7
                 startAngle:DEGREES_TO_RADIANS(40)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(100.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(155.0, 215.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForD1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    return aPath;
}

- (BOOL) isD1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(100.0, 130.0)] &&
       [path containsPoint:CGPointMake(100.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForD2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(140.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(155.0, 115.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(310)
                  clockwise:YES];
    [aPath addArcWithCenter:CGPointMake(140.0, 130.0)
                     radius:91
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:YES];
    [aPath addArcWithCenter:CGPointMake(155.0, 145.0)
                     radius:69.7
                 startAngle:DEGREES_TO_RADIANS(40)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    //[aPath moveToPoint:CGPointMake(155.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    return aPath;
}

- (BOOL) isD2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(140.0, 45.0)] &&
       [path containsPoint:CGPointMake(231.0, 130.0)] &&
       [path containsPoint:CGPointMake(150.0, 215.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseD:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isD1Completed:path] && [self isD2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - E

+ (UIBezierPath *) pathForUppercaseE
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    [aPath moveToPoint:CGPointMake(110.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(195.0, 130.0)];
    [aPath moveToPoint:CGPointMake(110.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 215.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForE1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    return aPath;
}

- (BOOL) isE1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(110.0, 215.0)] &&
       [path containsPoint:CGPointMake(110.0, 45.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForE2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    return aPath;
}

- (BOOL) isE2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(210.0, 45.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForE3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(195.0, 130.0)];
    return aPath;
}

- (BOOL) isE3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 130.0)] &&
       [path containsPoint:CGPointMake(195.0, 130.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForE4
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 215.0)];
    return aPath;
}

- (BOOL) isE4Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 215.0)] &&
       [path containsPoint:CGPointMake(210.0, 215.0)] )    {
        
        self.step4Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseE:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isE1Completed:path] && [self isE2Completed:path] &&
       [self isE3Completed:path] && [self isE4Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - F

+ (UIBezierPath *) pathForUppercaseF
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    [aPath moveToPoint:CGPointMake(110.0, 125.0)];
    [aPath addLineToPoint:CGPointMake(185.0, 125.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForF1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    return aPath;
}

- (BOOL) isF1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(110.0, 215.0)] &&
       [path containsPoint:CGPointMake(110.0, 45.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForF2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    return aPath;
}

- (BOOL) isF2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(210.0, 45.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForF3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 125.0)];
    [aPath addLineToPoint:CGPointMake(185.0, 125.0)];
    return aPath;
}

- (BOOL) isF3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 125.0)] &&
       [path containsPoint:CGPointMake(185.0, 125.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseF:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isF1Completed:path] && [self isF2Completed:path] && [self isF3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma  mark - G

+ (UIBezierPath *) pathForUppercaseG
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(155.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(163.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(155.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(153.5, 140.0)];
    [aPath addLineToPoint:CGPointMake(205.0, 140.0)];
    [aPath moveToPoint:CGPointMake(205.0, 140.0)];
    [aPath addLineToPoint:CGPointMake(205.0, 190.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForG1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(155.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(163.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(155.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(205.0, 190.0)];
    [aPath addLineToPoint:CGPointMake(205.0, 140.0)];
    return aPath;
}

- (BOOL) isG1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(205, 70)] &&
       [path containsPoint:CGPointMake(155.0, 50.0)] &&
       [path containsPoint:CGPointMake(106, 70)] &&
       [path containsPoint:CGPointMake(80.5, 130.0)] &&
       [path containsPoint:CGPointMake(106, 190)] &&
       [path containsPoint:CGPointMake(155.0, 210.0)] &&
       [path containsPoint:CGPointMake(205.0, 190.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForG2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(153.5, 140.0)];
    [aPath addLineToPoint:CGPointMake(205.0, 140.0)];
    return aPath;
}

- (BOOL) isG2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(205.0, 140.0)] &&
       [path containsPoint:CGPointMake(153.5, 140.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseG:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isG1Completed:path] && [self isG2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - H

+ (UIBezierPath *) pathForUppercaseH
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    [aPath moveToPoint:CGPointMake(100.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 130.0)];
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForH1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    return aPath;
}

- (BOOL) isH1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(100.0, 87.5)] &&
       [path containsPoint:CGPointMake(100.0, 130.0)] &&
       [path containsPoint:CGPointMake(100.0, 172.5)] &&
       [path containsPoint:CGPointMake(100.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForH2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 130.0)];
    return aPath;
}

- (BOOL) isH2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 130.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] &&
       [path containsPoint:CGPointMake(220.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForH3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

- (BOOL) isH3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(220.0, 130.0)] &&
       [path containsPoint:CGPointMake(220.0, 45.0)] &&
       [path containsPoint:CGPointMake(220.0, 87.5)] &&
       [path containsPoint:CGPointMake(220.0, 172.5)] &&
       [path containsPoint:CGPointMake(220.0, 215.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseH:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isH1Completed:path] && [self isH2Completed:path] && [self isH3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - I
+ (UIBezierPath *) pathForUppercaseI
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 215.0)];
    [aPath moveToPoint:CGPointMake(110.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(210, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForI1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(210.0, 45.0)];
    return aPath;
}

- (BOOL) isI1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(210.0, 45.0)] &&
       [path containsPoint:CGPointMake(160.0, 45.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForI2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 215.0)];
    return aPath;
}

- (BOOL) isI2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 45.0)] &&
       [path containsPoint:CGPointMake(160.0, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForI3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(210, 215.0)];
    return aPath;
}

- (BOOL) isI3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 215.0)] &&
       [path containsPoint:CGPointMake(110.0, 215.0)] &&
       [path containsPoint:CGPointMake(210, 215.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseI:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isI1Completed:path] && [self isI2Completed:path] && [self isI3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - J
+ (UIBezierPath *) pathForUppercaseJ
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(130.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(200.0, 50.0)];
    
    [aPath moveToPoint:CGPointMake(200.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(200.0, 170.0)];
    
    [aPath addArcWithCenter:CGPointMake(151, 165)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(20)
                   endAngle:DEGREES_TO_RADIANS(170)
                  clockwise:YES];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseJ:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(130.0, 50.0)] &&
       [path containsPoint:CGPointMake(200.0, 50.0)] &&
       [path containsPoint:CGPointMake(200.0, 50.0)] &&
       [path containsPoint:CGPointMake(200.0, 170.0)] &&
       [path containsPoint:CGPointMake(151, 215)] &&
       [path containsPoint:CGPointMake(189.3, 178.96)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - K
+ (UIBezierPath *) pathForUppercaseK
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 145.0)];
    [aPath moveToPoint:CGPointMake(120.0, 135.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForK1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    return aPath;
}

- (BOOL) isK1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(110.0, 215.0)] &&
       [path containsPoint:CGPointMake(110.0, 145.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForK2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 145.0)];
    return aPath;
}

- (BOOL) isK2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(220.0, 45.0)] &&
       [path containsPoint:CGPointMake(110.0, 145.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForK3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 135.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

- (BOOL) isK3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 135.0)] &&
       [path containsPoint:CGPointMake(220, 215.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseK:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isK1Completed:path] && [self isK2Completed:path] && [self isK3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - L
+ (UIBezierPath *) pathForUppercaseL
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(105.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(105.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(105.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(215.0, 215.0)];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseL:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(105.0, 45.0)] &&
       [path containsPoint:CGPointMake(105.0, 215.0)] &&
       [path containsPoint:CGPointMake(215.0, 215.0)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - M
+ (UIBezierPath *) pathForUppercaseM
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(80.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(80.0, 215.0)];
    [aPath moveToPoint:CGPointMake(80.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 175.0)];
    [aPath moveToPoint:CGPointMake(160.0, 175.0)];
    [aPath addLineToPoint:CGPointMake(240.0, 45.0)];
    [aPath moveToPoint:CGPointMake(240.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(240.0, 215.0)];   
    return aPath;
}

+ (UIBezierPath *) pathForM1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(80.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(80.0, 215.0)];
    return aPath;
}

- (BOOL) isM1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(80.0, 45.0)] &&
       [path containsPoint:CGPointMake(80.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForM2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(80.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 175.0)];
    return aPath;
}

- (BOOL) isM2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(80.0, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 175.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForM3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(240.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 175.0)];
    return aPath;
}

- (BOOL) isM3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 175.0)] &&
       [path containsPoint:CGPointMake(240.0, 45.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForM4
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(240.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(240.0, 215.0)];
    return aPath;
}

- (BOOL) isM4Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(240.0, 45.0)] &&
       [path containsPoint:CGPointMake(240.0, 215.0)] )    {
        
        self.step4Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseM:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isM1Completed:path] && [self isM2Completed:path] &&
       [self isM3Completed:path] && [self isM4Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - N
+ (UIBezierPath *) pathForUppercaseN
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForN1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 215.0)];
    return aPath;
}

- (BOOL) isN1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(100.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForN2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

- (BOOL) isN2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(220, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForN3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

- (BOOL) isN3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(220.0, 45.0)] &&
       [path containsPoint:CGPointMake(220, 215.0)] &&
       [path containsPoint:CGPointMake(220.0, 130.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseN:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isN1Completed:path] && [self isN2Completed:path] && [self isN3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - O
+ (UIBezierPath *) pathForUppercaseO
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    // 1st half
    [aPath addArcWithCenter:CGPointMake(160.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(168.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(160.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:NO];
    // 2nd half
    [aPath addArcWithCenter:CGPointMake(160.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(90)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(151.5, 129.5)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(45)
                   endAngle:DEGREES_TO_RADIANS(318)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(160.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(319)
                   endAngle:DEGREES_TO_RADIANS(270)
                  clockwise:NO];
    
    return aPath;
}

+ (UIBezierPath *) pathForO1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(160.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(168.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(160.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:NO];
    return aPath;
}

- (BOOL) isO1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 50.0)] &&
       [path containsPoint:CGPointMake(114, 68.69)] &&
       [path containsPoint:CGPointMake(85.5, 130.0)] &&
       [path containsPoint:CGPointMake(109, 188.07)] &&
       [path containsPoint:CGPointMake(160.0, 210.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForO2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(160.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(90)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(151.5, 129.5)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(45)
                   endAngle:DEGREES_TO_RADIANS(318)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(160.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(319)
                   endAngle:DEGREES_TO_RADIANS(270)
                  clockwise:NO];
    return aPath;
}

- (BOOL) isO2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 50.0)] &&
       [path containsPoint:CGPointMake(208.81, 68.69)] &&
       [path containsPoint:CGPointMake(234.81, 128.69)] &&
       [path containsPoint:CGPointMake(160.0, 210.0)] &&
       [path containsPoint:CGPointMake(210, 190.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseO:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isO1Completed:path] && [self isO2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - P
+ (UIBezierPath *) pathForUppercaseP
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(160, 87.5)
                     radius:42.5
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(120.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 130.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForP1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 215.0)];
    return aPath;
}

- (BOOL) isP1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
       [path containsPoint:CGPointMake(120.0, 87.5)] &&
       [path containsPoint:CGPointMake(120.0, 130.0)] &&
       [path containsPoint:CGPointMake(120.0, 161.5)] &&
       [path containsPoint:CGPointMake(120.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForP2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(160, 87.5)
                     radius:42.5
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(160.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 130.0)];
    return aPath;
}

- (BOOL) isP2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(120.0, 45.0)] &&
       [path containsPoint:CGPointMake(120.0, 130.0)] &&
       [path containsPoint:CGPointMake(160.0, 45.0)] &&
       [path containsPoint:CGPointMake(202.5, 87.5)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseP:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isP1Completed:path] && [self isP2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - Q
+ (UIBezierPath *) pathForUppercaseQ
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(160.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(319)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(168.5, 130.0)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(160.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(135)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    [aPath addArcWithCenter:CGPointMake(151.5, 129.5)
                     radius:83
                 startAngle:DEGREES_TO_RADIANS(45)
                   endAngle:DEGREES_TO_RADIANS(318)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(161.5, 175.5)];
    [aPath addLineToPoint:CGPointMake(215.0, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForQ3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(161.5, 175.5)];
    [aPath addLineToPoint:CGPointMake(215.0, 215.0)];
    return aPath;
}

- (BOOL) isQ3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(167, 180)] &&
       [path containsPoint:CGPointMake(214, 214)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseQ:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isO1Completed:path] && [self isO2Completed:path] && [self isQ3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - R
+ (UIBezierPath *) pathForUppercaseR
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(170.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(170, 87.5)
                     radius:42.5
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(110.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(170.0, 130.0)];
    
    [aPath moveToPoint:CGPointMake(130.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 215.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForR1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 215.0)];
    return aPath;
}

- (BOOL) isR1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(110.0, 87.5)] &&
       [path containsPoint:CGPointMake(110.0, 130.0)] &&
       [path containsPoint:CGPointMake(110.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForR2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(110.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(170.0, 45.0)];
    
    [aPath addArcWithCenter:CGPointMake(170, 87.5)
                     radius:42.5
                 startAngle:DEGREES_TO_RADIANS(270)
                   endAngle:DEGREES_TO_RADIANS(90)
                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(170.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(110.0, 130.0)];
    
    return aPath;
}

- (BOOL) isR2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(170.0, 45.0)] &&
       [path containsPoint:CGPointMake(212.5, 87.5)] &&
       [path containsPoint:CGPointMake(170, 130)] &&
       [path containsPoint:CGPointMake(110.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForR3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(130.0, 130.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 215.0)];
    return aPath;
}

- (BOOL) isR3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(130, 130)] &&
       [path containsPoint:CGPointMake(220, 215)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseR:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isR1Completed:path] && [self isR2Completed:path] && [self isR3Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark- S
+ (UIBezierPath *) pathForUppercaseS
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(155.0, 120.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(319)
                   endAngle:DEGREES_TO_RADIANS(225)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(126.0, 96)
                     radius:32
                 startAngle:DEGREES_TO_RADIANS(225)
                   endAngle:DEGREES_TO_RADIANS(100)
                  clockwise:NO];
    
    //[aPath addLineToPoint:CGPointMake(190, 150.0)];
    
    [aPath addArcWithCenter:CGPointMake(183.5, 165)
                     radius:32
                 startAngle:DEGREES_TO_RADIANS(280)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:YES];
    
    [aPath addArcWithCenter:CGPointMake(155.0, 140.0)
                     radius:70
                 startAngle:DEGREES_TO_RADIANS(45)
                   endAngle:DEGREES_TO_RADIANS(135)
                  clockwise:YES];
    
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseS:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(203.81, 68.69)] &&
       [path containsPoint:CGPointMake(155.0, 50.0)] &&
       [path containsPoint:CGPointMake(104.82, 68.69)] &&
       [path containsPoint:CGPointMake(94, 96)] &&
       [path containsPoint:CGPointMake(104.82, 130)] &&
       [path containsPoint:CGPointMake(155.0, 140.0)] &&
       [path containsPoint:CGPointMake(203.81, 130.0)] &&
       [path containsPoint:CGPointMake(215.5, 165.0)] &&
       [path containsPoint:CGPointMake(203.81, 190.0)] &&
       [path containsPoint:CGPointMake(155, 210.0)] &&
       [path containsPoint:CGPointMake(203, 190.0)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - T
+ (UIBezierPath *) pathForUppercaseT
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 50.0)];
    
    [aPath moveToPoint:CGPointMake(160.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 220.0)];
    
    return aPath;
}

+ (UIBezierPath *) pathForT1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(220.0, 50.0)];
    return aPath;
}

- (BOOL) isT1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 50.0)] &&
       [path containsPoint:CGPointMake(220.0, 50.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForT2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 50.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 220.0)];
    return aPath;
}

- (BOOL) isT2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 50.0)] &&
       [path containsPoint:CGPointMake(160.0, 220.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseT:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isT1Completed:path] && [self isT2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - U
+ (UIBezierPath *) pathForUppercaseU
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 162.5)];
    
    [aPath addArcWithCenter:CGPointMake(160, 162.5)
                     radius:60
                 startAngle:DEGREES_TO_RADIANS(180)
                   endAngle:DEGREES_TO_RADIANS(0)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(220.0, 162.5)];
    [aPath addLineToPoint:CGPointMake(220, 40.0)];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseU:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(100.0, 30.0)] &&
       [path containsPoint:CGPointMake(100.0, 157.5)] &&
       [path containsPoint:CGPointMake(100, 157.5)] &&
       [path containsPoint:CGPointMake(160, 217.5)] &&
       [path containsPoint:CGPointMake(220, 157.5)] &&
       [path containsPoint:CGPointMake(220.0, 30.0)] &&
       [path containsPoint:CGPointMake(220, 157.5)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - V
+ (UIBezierPath *) pathForUppercaseV
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(90.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 215.0)];
    
    [aPath moveToPoint:CGPointMake(160.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(230.0, 45.0)];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseV:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(90.0, 45.0)] &&
       [path containsPoint:CGPointMake(160.0, 215.0)] &&
       [path containsPoint:CGPointMake(230.0, 45.0)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - W
+ (UIBezierPath *) pathForUppercaseW
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(70.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(123.0, 215.0)];
    [aPath moveToPoint:CGPointMake(123.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(160.0, 95.0)];
    [aPath moveToPoint:CGPointMake(160.0, 95.0)];
    [aPath addLineToPoint:CGPointMake(207.0, 215.0)];
    [aPath moveToPoint:CGPointMake(207.0, 215.0)];
    [aPath addLineToPoint:CGPointMake(250.0, 45.0)];
    return aPath;
}

+ (UIBezierPath *) pathForW1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(70.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(123.0, 215.0)];
    return aPath;
}

- (BOOL) isW1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(70.0, 45.0)] &&
       [path containsPoint:CGPointMake(123.0, 215.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForW2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 95.0)];
    [aPath addLineToPoint:CGPointMake(123.0, 215.0)];
    return aPath;
}

- (BOOL) isW2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(123.0, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 95.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForW3
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(160.0, 95.0)];
    [aPath addLineToPoint:CGPointMake(207.0, 215.0)];
    return aPath;
}

- (BOOL) isW3Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(160.0, 95.0)] &&
       [path containsPoint:CGPointMake(207.0, 215.0)] )    {
        
        self.step3Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForW4
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(250.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(207.0, 215.0)];
    return aPath;
}

- (BOOL) isW4Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(207.0, 215.0)] &&
       [path containsPoint:CGPointMake(250.0, 45.0)] )    {
        
        self.step4Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseW:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isW1Completed:path] && [self isW2Completed:path] &&
       [self isW3Completed:path] && [self isW4Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - X
+ (UIBezierPath *) pathForUppercaseX
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100, 215.0)];
    return aPath;
}

+ (UIBezierPath *) pathForX1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    return aPath;
}

- (BOOL) isX1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(100.0, 45.0)] &&
       [path containsPoint:CGPointMake(220, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForX2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100, 215.0)];
    return aPath;
}

- (BOOL) isX2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(220.0, 45.0)] &&
       [path containsPoint:CGPointMake(100, 215.0)] &&
       [path containsPoint:CGPointMake(160.0, 130.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseX:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isX1Completed:path] && [self isX2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - Y
+ (UIBezierPath *) pathForUppercaseY
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(95.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(165, 130.0)];
    [aPath moveToPoint:CGPointMake(165, 130.0)];
    [aPath addLineToPoint:CGPointMake(225, 45.0)];
    [aPath moveToPoint:CGPointMake(165, 130.0)];
    [aPath addLineToPoint:CGPointMake(165, 215.0)];    
    return aPath;
}

+ (UIBezierPath *) pathForY1
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(95.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(155, 120.0)];
    return aPath;
}

- (BOOL) isY1Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(95.0, 45.0)] &&
       [path containsPoint:CGPointMake(165, 130.0)] )    {
        
        self.step1Completed = YES;
        return YES;
    }
    return NO;
}

+ (UIBezierPath *) pathForY2
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(225, 45.0)];
    [aPath addLineToPoint:CGPointMake(165, 130.0)];
    [aPath addLineToPoint:CGPointMake(165, 215.0)];
    return aPath;
}

- (BOOL) isY2Completed:(UIBezierPath *)path {
    
    if( [path containsPoint:CGPointMake(165, 130.0)] &&
       [path containsPoint:CGPointMake(225, 45.0)] &&
       [path containsPoint:CGPointMake(165, 215.0)] )    {
        
        self.step2Completed = YES;
        return YES;
    }
    return NO;
}

- (BOOL) checkPathForUppercaseY:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [self isY1Completed:path] && [self isY2Completed:path] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - Z
+ (UIBezierPath *) pathForUppercaseZ
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(220, 45.0)];
    
    [aPath moveToPoint:CGPointMake(220.0, 45.0)];
    [aPath addLineToPoint:CGPointMake(100, 215.0)];
    
    [aPath moveToPoint:CGPointMake(100, 215.0)];
    [aPath addLineToPoint:CGPointMake(220, 215.0)];
    
    return aPath;
}

+ (BOOL) checkPathForUppercaseZ:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(110.0, 45.0)] &&
       [path containsPoint:CGPointMake(210, 45.0)] &&
       [path containsPoint:CGPointMake(110, 215.0)] &&
       [path containsPoint:CGPointMake(210, 215.0)] &&
       [path containsPoint:CGPointMake(170.0, 130.0)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - SubPaths for Capital letters

+ (UIBezierPath *) subpath1ForAlphabet:(char)c
{
    NSLog(@"subpath1");
    UIBezierPath *subpath = nil;
    switch ( c ) {
            
        default:
        case 'A':   subpath = [Alphabet pathForA1];    break;
        case 'B':   subpath = [Alphabet pathForB1];    break;
        case 'C':   subpath = [Alphabet pathForUppercaseC];    break;
        case 'D':   subpath = [Alphabet pathForD1];    break;
        case 'E':   subpath = [Alphabet pathForE1];    break;
        case 'F':   subpath = [Alphabet pathForF1];    break;
        case 'G':   subpath = [Alphabet pathForG1];    break;
        case 'H':   subpath = [Alphabet pathForH1];    break;
        case 'I':   subpath = [Alphabet pathForI1];    break;
        case 'J':   subpath = [Alphabet pathForUppercaseJ];    break;
        case 'K':   subpath = [Alphabet pathForK1];    break;
        case 'L':   subpath = [Alphabet pathForUppercaseL];    break;
        case 'M':   subpath = [Alphabet pathForM1];    break;
        case 'N':   subpath = [Alphabet pathForN1];    break;
        case 'O':
        case 'Q':   subpath = [Alphabet pathForO1];    break;
        case 'P':   subpath = [Alphabet pathForP1];    break;
        case 'R':   subpath = [Alphabet pathForR1];    break;
        case 'S':   subpath = [Alphabet pathForUppercaseS];    break;
        case 'T':   subpath = [Alphabet pathForT1];    break;
        case 'U':   subpath = [Alphabet pathForUppercaseU];    break;
        case 'V':   subpath = [Alphabet pathForUppercaseV];    break;
        case 'W':   subpath = [Alphabet pathForW1];    break;
        //case 'W':   subpath = [Alphabet pathForUppercaseW];    break;
        case 'X':   subpath = [Alphabet pathForX1];    break;
        case 'Y':   subpath = [Alphabet pathForY1];    break;
        case 'Z':   subpath = [Alphabet pathForUppercaseZ];    break;
    }
    return subpath;
}

+ (UIBezierPath *) subpath2ForAlphabet:(char)c
{
    NSLog(@"subpath2");
    UIBezierPath *subpath = nil;
    switch ( c ) {
            
        default:
        case 'A':   subpath = [Alphabet pathForA2];    break;
        case 'B':   subpath = [Alphabet pathForB2];    break;
        case 'D':   subpath = [Alphabet pathForD2];    break;
        case 'E':   subpath = [Alphabet pathForE2];    break;
        case 'F':   subpath = [Alphabet pathForF2];    break;
        case 'G':   subpath = [Alphabet pathForG2];    break;
        case 'H':   subpath = [Alphabet pathForH2];    break;
        case 'I':   subpath = [Alphabet pathForI2];    break;
        case 'K':   subpath = [Alphabet pathForK2];    break;
        case 'M':   subpath = [Alphabet pathForM2];    break;
        case 'N':   subpath = [Alphabet pathForN2];    break;
        case 'O':
        case 'Q':   subpath = [Alphabet pathForO2];    break;
        case 'P':   subpath = [Alphabet pathForP2];    break;
        case 'R':   subpath = [Alphabet pathForR2];    break;
        case 'T':   subpath = [Alphabet pathForT2];    break;
        case 'W':   subpath = [Alphabet pathForW2];    break;
        case 'X':   subpath = [Alphabet pathForX2];    break;
        case 'Y':   subpath = [Alphabet pathForY2];    break;
    }
    return subpath;
}

+ (UIBezierPath *) subpath3ForAlphabet:(char)c
{
    NSLog(@"subpath3");
    UIBezierPath *subpath = nil;
    switch ( c ) {
            
        default:
        case 'A':   subpath = [Alphabet pathForA3];    break;
        case 'B':   subpath = [Alphabet pathForB3];    break;
        case 'E':   subpath = [Alphabet pathForE3];    break;
        case 'F':   subpath = [Alphabet pathForF3];    break;
        case 'H':   subpath = [Alphabet pathForH3];    break;
        case 'I':   subpath = [Alphabet pathForI3];    break;
        case 'K':   subpath = [Alphabet pathForK3];    break;
        case 'M':   subpath = [Alphabet pathForM3];    break;
        case 'N':   subpath = [Alphabet pathForN3];    break;
        case 'Q':   subpath = [Alphabet pathForQ3];    break;
        case 'R':   subpath = [Alphabet pathForR3];    break;
        case 'W':   subpath = [Alphabet pathForW3];    break;
    }
    return subpath;
}

+ (UIBezierPath *) subpath4ForAlphabet:(char)c
{
    NSLog(@"subpath4");
    UIBezierPath *subpath = nil;
    
    switch ( c ) {
        
        default:
        case 'E':   subpath = [Alphabet pathForE4];    break;
        case 'M':   subpath = [Alphabet pathForM4];    break;
        case 'W':   subpath = [Alphabet pathForW4];    break;
    }
    return subpath;
}

#pragma mark - Small letters

+ (UIBezierPath *) pathForLowercaseA
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(199, 73)];
    [aPath addCurveToPoint:CGPointMake(103, 159) controlPoint1:CGPointMake(115, 55)
             controlPoint2:CGPointMake(95, 117)];
    [aPath moveToPoint:CGPointMake(103, 159)];
    [aPath addCurveToPoint:CGPointMake(208, 163) controlPoint1:CGPointMake(110, 214)
             controlPoint2:CGPointMake(197, 224)];
    [aPath moveToPoint:CGPointMake(209, 73)];
    [aPath addCurveToPoint:CGPointMake(223, 208) controlPoint1:CGPointMake(209, 163)
             controlPoint2:CGPointMake(205, 198)];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseA:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(209, 73)] &&
       [path containsPoint:CGPointMake(155, 73)] &&
       [path containsPoint:CGPointMake(118, 93)] &&
       [path containsPoint:CGPointMake(103, 159)] &&
       [path containsPoint:CGPointMake(155, 205)] &&
       [path containsPoint:CGPointMake(210, 140)] &&
       [path containsPoint:CGPointMake(224, 208)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseB
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(120.0, 30.0)];
    [aPath addLineToPoint:CGPointMake(120.0, 200.0)];
    [aPath moveToPoint:CGPointMake(120, 120)];
    [aPath addArcWithCenter:CGPointMake(168, 152)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(235)
                   endAngle:DEGREES_TO_RADIANS(145)
                  clockwise:YES];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseB:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(120, 30)] &&
       [path containsPoint:CGPointMake(120, 120)] &&
       [path containsPoint:CGPointMake(120, 174)] &&
       [path containsPoint:CGPointMake(120, 200)] &&
       [path containsPoint:CGPointMake(168, 102)] &&
       [path containsPoint:CGPointMake(218, 152)] &&
       [path containsPoint:CGPointMake(168, 202)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseC
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(168, 152)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseC:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(204, 116)] &&
       [path containsPoint:CGPointMake(168, 102)] &&
       [path containsPoint:CGPointMake(118, 152)] &&
       [path containsPoint:CGPointMake(168, 202)] &&
       [path containsPoint:CGPointMake(204, 188)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseD
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(158, 152)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(315)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(200, 30)];
    [aPath addLineToPoint:CGPointMake(200, 200)];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseD:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(194, 116)] &&
       [path containsPoint:CGPointMake(158, 102)] &&
       [path containsPoint:CGPointMake(108, 152)] &&
       [path containsPoint:CGPointMake(158, 202)] &&
       [path containsPoint:CGPointMake(194, 188)] &&
       [path containsPoint:CGPointMake(200, 30)] &&
       [path containsPoint:CGPointMake(200, 115)] &&
       [path containsPoint:CGPointMake(200, 200)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseE
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(163, 147)
                     radius:43
                 startAngle:DEGREES_TO_RADIANS(2)
                   endAngle:DEGREES_TO_RADIANS(180)
                  clockwise:NO];
    
    [aPath addArcWithCenter:CGPointMake(168, 160)
                     radius:49
                 startAngle:DEGREES_TO_RADIANS(190)
                   endAngle:DEGREES_TO_RADIANS(45)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(205, 150)];
    [aPath addLineToPoint:CGPointMake(119.6, 150)];
    [aPath addLineToPoint:CGPointMake(119.8, 147)];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseE:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(204, 150)] &&
       [path containsPoint:CGPointMake(168, 105)] &&
       [path containsPoint:CGPointMake(118, 150)] &&
       [path containsPoint:CGPointMake(168, 209)] &&
       [path containsPoint:CGPointMake(204, 195)] &&
       [path containsPoint:CGPointMake(167, 150)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseF
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(170, 60)
                     radius:30
                 startAngle:DEGREES_TO_RADIANS(340)
                   endAngle:DEGREES_TO_RADIANS(180)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(140, 60)];
    [aPath addLineToPoint:CGPointMake(140, 200)];
    
    [aPath moveToPoint:CGPointMake(120, 100)];
    [aPath addLineToPoint:CGPointMake(190, 100)];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseF:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(170, 30)] &&
       [path containsPoint:CGPointMake(200, 50)] &&
       [path containsPoint:CGPointMake(140, 80)] &&
       [path containsPoint:CGPointMake(140, 200)] &&
       [path containsPoint:CGPointMake(120, 100)] &&
       [path containsPoint:CGPointMake(190, 100)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseG
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath addArcWithCenter:CGPointMake(168, 152)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(335)
                   endAngle:DEGREES_TO_RADIANS(35)
                  clockwise:NO];
    
    [aPath moveToPoint:CGPointMake(214, 100)];
    [aPath addLineToPoint:CGPointMake(214, 188)];
    
    [aPath addArcWithCenter:CGPointMake(164, 228)
                     radius:50
                 startAngle:DEGREES_TO_RADIANS(0)
                   endAngle:DEGREES_TO_RADIANS(150)
                  clockwise:YES];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseG:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(204, 116)] &&
       [path containsPoint:CGPointMake(168, 102)] &&
       [path containsPoint:CGPointMake(118, 152)] &&
       [path containsPoint:CGPointMake(168, 202)] &&
       [path containsPoint:CGPointMake(204, 188)] &&
       [path containsPoint:CGPointMake(214, 120)] &&
       [path containsPoint:CGPointMake(214, 188)] &&
       [path containsPoint:CGPointMake(214, 228)] &&
       [path containsPoint:CGPointMake(121, 253)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

+ (UIBezierPath *) pathForLowercaseH
{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = PATH_WIDTH;
    
    [aPath moveToPoint:CGPointMake(100.0, 30.0)];
    [aPath addLineToPoint:CGPointMake(100.0, 200.0)];
    
//    [aPath moveToPoint:CGPointMake(100.0, 140.0)];
//    [aPath addArcWithCenter:CGPointMake(150, 160)
//                     radius:49
//                 startAngle:DEGREES_TO_RADIANS(215)
//                   endAngle:DEGREES_TO_RADIANS(355)
//                  clockwise:YES];
    
    [aPath moveToPoint:CGPointMake(100.0, 140.0)];
    [aPath addCurveToPoint:CGPointMake(200.0, 200.0)
             controlPoint1:CGPointMake(160, 190)
             controlPoint2:CGPointMake(180, 150)];
    
    [aPath addLineToPoint:CGPointMake(200.0, 200.0)];
    
    return aPath;
}

+ (BOOL) checkPathForLowercaseH:(UIBezierPath *)path
{
    BOOL isPathFollowed = NO;
    
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, path.lineWidth, path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    if( [path containsPoint:CGPointMake(120, 30)] &&
       [path containsPoint:CGPointMake(120, 120)] &&
       [path containsPoint:CGPointMake(120, 174)] &&
       [path containsPoint:CGPointMake(120, 200)] &&
       [path containsPoint:CGPointMake(168, 102)] &&
       [path containsPoint:CGPointMake(218, 152)] &&
       [path containsPoint:CGPointMake(168, 202)] )    {
        
        isPathFollowed = YES;
    }
    
    return isPathFollowed;
}

#pragma mark - Generic methods

- (CGPoint) startingAtPoint
{
    CGPoint startingPoint;
    
    switch ( self.alphabetChar ) {
        case 'A':
        default:
            if( !self.step1Completed || ( self.step1Completed && !self.step2Completed) )  {
                startingPoint = CGPointMake(160.0, 45.0);
            }
            else if( !self.step3Completed )  {
                startingPoint = CGPointMake(110.0, 155.0);
            }
            break;
            
        case 'B':
            if( !self.step1Completed || ( self.step1Completed && !self.step2Completed) )  {
                startingPoint = CGPointMake(120.0, 45.0);
            }
            else if( !self.step3Completed )  {
                startingPoint = CGPointMake(120.0, 130.0);
            }
            break;
            
        case 'C':
            if( !self.step1Completed )  {
                startingPoint = CGPointMake(203.81, 68.69);
            }
            break;
            
        case 'D':
            if( !self.step1Completed || !self.step2Completed )  {
                startingPoint = CGPointMake(100.0, 45.0);
            }
            break;
            
        case 'E':
            if ( !self.step1Completed || !self.step2Completed ) {
                startingPoint = CGPointMake(110.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(110.0, 130.0);
            }
            else if ( !self.step4Completed )    {
                startingPoint = CGPointMake(110.0, 215.0);
            }
            break;
            
        case 'F':
            if ( !self.step1Completed || !self.step2Completed ) {
                startingPoint = CGPointMake(110.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(110.0, 125.0);
            }
            break;
            
        case 'G':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(205, 70);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(153.5, 140.0);
            }
            break;
            
        case 'H':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(100.0, 45.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(100.0, 130.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(220.0, 45.0);
            }
            break;
            
        case 'I':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(110.0, 45.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(160.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(110.0, 215.0);
            }
            break;
            
        case 'J':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(130.0, 50.0);
            }
            break;
            
        case 'K':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(110.0, 45.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(220.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(140.0, 135.0);
            }
            break;
            
        case 'L':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(105.0, 45.0);
            }
            break;
            
        case 'M':
            if ( !self.step1Completed || !self.step2Completed ) {
                startingPoint = CGPointMake(80.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(240.0, 45.0);
            }
            else if ( !self.step4Completed )    {
                startingPoint = CGPointMake(240.0, 45.0);
            }
            break;
            
        case 'N':
            if ( !self.step1Completed || !self.step2Completed ) {
                startingPoint = CGPointMake(100.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(220.0, 45.0);
            }
            break;
            
        case 'O':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(160.0, 50.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(160.0, 210.0);
            }
            break;
            
        case 'P':
            if ( !self.step1Completed || !self.step2Completed )    {
                startingPoint = CGPointMake(120.0, 45.0);
            }
            break;
            
        case 'Q':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(160.0, 50.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(160.0, 210.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(167, 180);
            }
            break;
            
        case 'R':
            if ( !self.step1Completed || !self.step2Completed ) {
                startingPoint = CGPointMake(110.0, 45.0);
            }
            else if ( !self.step3Completed )    {
                startingPoint = CGPointMake(130.0, 130.0);
            }
            break;
            
        case 'S':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(203.81, 68.69);
            }
            break;
            
        case 'T':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(100.0, 50.0);
            }
            else if ( !self.step2Completed )    {
                startingPoint = CGPointMake(160.0, 50.0);
            }
            break;
            
        case 'U':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(100.0, 40.0);
            }
            break;
            
        case 'V':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(90.0, 45.0);
            }
            break;
            
        case 'W':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(70.0, 45.0);
            }
            else if ( !self.step2Completed ) {
                startingPoint = CGPointMake(160.0, 95.0);
            }
            else if ( !self.step3Completed ) {
                startingPoint = CGPointMake(160.0, 95.0);
            }
            else if ( !self.step4Completed ) {
                startingPoint = CGPointMake(250.0, 45.0);
            }
            break;
            
        case 'X':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(100.0, 45.0);
            }
            else if ( !self.step2Completed ) {
                startingPoint = CGPointMake(220.0, 45.0);
            }
            break;
            
        case 'Y':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(95.0, 45.0);
            }
            else if ( !self.step2Completed ) {
                startingPoint = CGPointMake(225, 45.0);
            }
            break;
            
        case 'Z':
            if ( !self.step1Completed ) {
                startingPoint = CGPointMake(100.0, 45.0);
            }
            break;
    }
    
    return startingPoint;
}
/*
- (BOOL) canAlphabetStartAtPoint:(CGPoint) point
{
    switch ( self.alphabetChar ) {
        case 'A':
        default:
            if( !self.step1Completed || ( self.step1Completed && !self.step2Completed) )  {
                ComparePoints(point, CGPointMake(160.0, 45.0))
            }
            else if( !self.step3Completed )  {
                ComparePoints(point, CGPointMake(110.0, 155.0))
            }
            break;
            
        case 'B':
            if( !self.step1Completed || ( self.step1Completed && !self.step2Completed) )  {
                NSLog(@"step1 / 2");
                ComparePoints(point, CGPointMake(120.0, 45.0))
            }
            else if( !self.step3Completed )  {
                NSLog(@"step3");
                ComparePoints(point, CGPointMake(120.0, 130.0))
            }
            break;
            
        case 'C':
            if( !self.step1Completed )  {
                ComparePoints(point, CGPointMake(203.81, 68.69))
            }
            break;
            
        case 'D':
            if( !self.step1Completed || !self.step2Completed )  {
                ComparePoints(point, CGPointMake(100.0, 45.0))
            }
            break;
            
        case 'E':
            if ( !self.step1Completed || !self.step2Completed ) {
                ComparePoints(point, CGPointMake(110.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(110.0, 130.0))
            }
            else if ( !self.step4Completed )    {
                ComparePoints(point, CGPointMake(110.0, 215.0))
            }
            break;
            
        case 'F':
            if ( !self.step1Completed || !self.step2Completed ) {
                ComparePoints(point, CGPointMake(110.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(110.0, 125.0))
            }
            break;
            
        case 'G':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(205, 70))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(153.5, 140.0))
            }
            break;
            
        case 'H':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(100.0, 45.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(100.0, 130.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(220.0, 45.0))
            }
            break;
            
        case 'I':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(110.0, 45.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(160.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(110.0, 215.0))
            }
            break;
            
        case 'J':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(130.0, 50.0))
            }
            break;
            
        case 'K':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(110.0, 45.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(220.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(140.0, 135.0))
            }
            break;
            
        case 'L':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(105.0, 45.0))
            }
            break;
            
        case 'M':
            if ( !self.step1Completed || !self.step2Completed ) {
                ComparePoints(point, CGPointMake(80.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(160.0, 175.0))
            }
            else if ( !self.step4Completed )    {
                ComparePoints(point, CGPointMake(240.0, 45.0))
            }
            break;
            
        case 'N':
            if ( !self.step1Completed || !self.step2Completed ) {
                ComparePoints(point, CGPointMake(100.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(220.0, 45.0))
            }
            break;
            
        case 'O':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(160.0, 50.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(160.0, 210.0))
            }
            break;
            
        case 'P':
            if ( !self.step1Completed || !self.step2Completed )    {
                ComparePoints(point, CGPointMake(120.0, 45.0))
            }
            break;
            
        case 'Q':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(160.0, 50.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(160.0, 210.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(167, 180))
            }
            break;
            
        case 'R':
            if ( !self.step1Completed || !self.step2Completed ) {
                ComparePoints(point, CGPointMake(110.0, 45.0))
            }
            else if ( !self.step3Completed )    {
                ComparePoints(point, CGPointMake(130.0, 130.0))
            }
            break;
            
        case 'S':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(203.81, 68.69))
            }
            break;
            
        case 'T':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(100.0, 50.0))
            }
            else if ( !self.step2Completed )    {
                ComparePoints(point, CGPointMake(160.0, 50.0))
            }
            break;
            
        case 'U':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(100.0, 40.0))
            }
            break;
            
        case 'V':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(90.0, 45.0))
            }
            break;
            
        case 'W':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(70.0, 45.0))
            }
            else if ( !self.step2Completed ) {
                ComparePoints(point, CGPointMake(160.0, 95.0))
            }
            else if ( !self.step3Completed ) {
                ComparePoints(point, CGPointMake(160.0, 95.0))
            }
            else if ( !self.step4Completed ) {
                ComparePoints(point, CGPointMake(250.0, 45.0))
            }
            break;
            
        case 'X':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(100.0, 45.0))
            }
            else if ( !self.step2Completed ) {
                ComparePoints(point, CGPointMake(220.0, 45.0))
            }
            break;
            
        case 'Y':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(95.0, 45.0))
            }
            else if ( !self.step2Completed ) {
                ComparePoints(point, CGPointMake(225, 45.0))
            }
            break;
            
        case 'Z':
            if ( !self.step1Completed ) {
                ComparePoints(point, CGPointMake(100.0, 45.0))
            }
            break;
    }
    
    return NO;
}
*/
+ (BOOL) canReStartDrawingAlphabet:(char)c fromPoint:(CGPoint)point
{
    switch ( c ) {
    
        case 'H': ComparePoints(point, CGPointMake(220.0, 45.0))    break;
        case 'I': ComparePoints(point, CGPointMake(110.0, 215.0))    break;
        case 'K': ComparePoints(point, CGPointMake(220.0, 45.0))    break;
        case 'N': ComparePoints(point, CGPointMake(220.0, 45.0))    break;
        case 'Q': ComparePoints(point, CGPointMake(161.5, 175.5))    break;
        case 'X': ComparePoints(point, CGPointMake(220.0, 45.0))    break;
        case 'Y': ComparePoints(point, CGPointMake(225, 45.0))    break;
            
        default:    return NO;  break;
    }
}

+ (UIBezierPath *) pathForAlphabet:(char)c
{
    UIBezierPath *path;
    switch ( c ) {
            
        case 'A':   path = [Alphabet pathForUppercaseA];    break;
        case 'B':   path = [Alphabet pathForUppercaseB];    break;
        case 'C':   path = [Alphabet pathForUppercaseC];    break;
        case 'D':   path = [Alphabet pathForUppercaseD];    break;
        case 'E':   path = [Alphabet pathForUppercaseE];    break;
        case 'F':   path = [Alphabet pathForUppercaseF];    break;
        case 'G':   path = [Alphabet pathForUppercaseG];    break;
        case 'H':   path = [Alphabet pathForUppercaseH];    break;
        case 'I':   path = [Alphabet pathForUppercaseI];    break;
        case 'J':   path = [Alphabet pathForUppercaseJ];    break;
        case 'K':   path = [Alphabet pathForUppercaseK];    break;
        case 'L':   path = [Alphabet pathForUppercaseL];    break;
        case 'M':   path = [Alphabet pathForUppercaseM];    break;
        case 'N':   path = [Alphabet pathForUppercaseN];    break;
        case 'O':   path = [Alphabet pathForUppercaseO];    break;
        case 'P':   path = [Alphabet pathForUppercaseP];    break;
        case 'Q':   path = [Alphabet pathForUppercaseQ];    break;
        case 'R':   path = [Alphabet pathForUppercaseR];    break;
        case 'S':   path = [Alphabet pathForUppercaseS];    break;
        case 'T':   path = [Alphabet pathForUppercaseT];    break;
        case 'U':   path = [Alphabet pathForUppercaseU];    break;
        case 'V':   path = [Alphabet pathForUppercaseV];    break;
        case 'W':   path = [Alphabet pathForUppercaseW];    break;
        case 'X':   path = [Alphabet pathForUppercaseX];    break;
        case 'Y':   path = [Alphabet pathForUppercaseY];    break;
        case 'Z':   path = [Alphabet pathForUppercaseZ];    break;
            
        case 'a':   path = [Alphabet pathForLowercaseA];    break;
        case 'b':   path = [Alphabet pathForLowercaseB];    break;
        case 'c':   path = [Alphabet pathForLowercaseC];    break;
        case 'd':   path = [Alphabet pathForLowercaseD];    break;
        case 'e':   path = [Alphabet pathForLowercaseE];    break;
        case 'f':   path = [Alphabet pathForLowercaseF];    break;
        case 'g':   path = [Alphabet pathForLowercaseG];    break;
        case 'h':   path = [Alphabet pathForLowercaseH];    break;
            
        default:    path = [Alphabet pathForUppercaseA];    break;
    }
    
    path.lineWidth = PATH_WIDTH;
    path.lineCapStyle = kCGLineCapRound;
    
    return path;
}

- (BOOL) checkPath:(UIBezierPath *)path forAlphabet:(char)c
{
    NSLog(@"checkPath: %@", path);
    path.lineWidth = TOUCH_WIDTH;
    
    switch ( c ) {
            
        case 'A':   return [self checkPathForUppercaseA:path];    break;
        case 'B':   return [self checkPathForUppercaseB:path];    break;
        case 'C':   return [Alphabet checkPathForUppercaseC:path];    break;
        case 'D':   return [self checkPathForUppercaseD:path];    break;
        case 'E':   return [self checkPathForUppercaseE:path];    break;
        case 'F':   return [self checkPathForUppercaseF:path];    break;
        case 'G':   return [self checkPathForUppercaseG:path];    break;
        case 'H':   return [self checkPathForUppercaseH:path];    break;
        case 'I':   return [self checkPathForUppercaseI:path];    break;
        case 'J':   return [Alphabet checkPathForUppercaseJ:path];    break;
        case 'K':   return [self checkPathForUppercaseK:path];    break;
        case 'L':   return [Alphabet checkPathForUppercaseL:path];    break;
        case 'M':   return [self checkPathForUppercaseM:path];    break;
        case 'N':   return [self checkPathForUppercaseN:path];    break;
        case 'O':   return [self checkPathForUppercaseO:path];    break;
        case 'P':   return [self checkPathForUppercaseP:path];    break;
        case 'Q':   return [self checkPathForUppercaseQ:path];    break;
        case 'R':   return [self checkPathForUppercaseR:path];    break;
        case 'S':   return [Alphabet checkPathForUppercaseS:path];    break;
        case 'T':   return [self checkPathForUppercaseT:path];    break;
        case 'U':   return [Alphabet checkPathForUppercaseU:path];    break;
        case 'V':   return [Alphabet checkPathForUppercaseV:path];    break;
        case 'W':   return [self checkPathForUppercaseW:path];    break;
        case 'X':   return [self checkPathForUppercaseX:path];    break;
        case 'Y':   return [self checkPathForUppercaseY:path];    break;
        case 'Z':   return [Alphabet checkPathForUppercaseZ:path];    break;
            
        case 'a':   return [Alphabet checkPathForLowercaseA:path];    break;
        case 'b':   return [Alphabet checkPathForLowercaseB:path];    break;
        case 'c':   return [Alphabet checkPathForLowercaseC:path];    break;
        case 'd':   return [Alphabet checkPathForLowercaseD:path];    break;
        case 'e':   return [Alphabet checkPathForLowercaseE:path];    break;
        case 'f':   return [Alphabet checkPathForLowercaseF:path];    break;
        case 'g':   return [Alphabet checkPathForLowercaseG:path];    break;
        case 'h':   return [Alphabet checkPathForLowercaseH:path];    break;
            
        default:    return [self checkPathForUppercaseA:path];    break;
    }
}

- (void)drawRect:(CGRect)rect
{
    // Create an path to draw.
    UIBezierPath *aPath = [Alphabet pathForAlphabet: self.alphabetChar];
//    aPath.lineCapStyle = kCGLineCapRound;
//    aPath.lineJoinStyle = kCGLineJoinMiter;
    
    // Set the render colors.
    [[UIColor lightGrayColor] setStroke];
    [[UIColor clearColor] setFill];
    
    //CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform.
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    //CGContextTranslateCTM(aRef, 50, 50);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = PATH_WIDTH;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
    
    aPath.lineWidth = 1;
    
    float lineDash[] = {6, 4};
    [aPath setLineDash:lineDash count:1 phase:0];
    [[UIColor whiteColor] setStroke];
    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
//    [self bringSubviewToFront: self.imageview];
}

#pragma mark - Memory management

-(void)dealloc
{
//    self.currentPath = nil;
//    self.pathArray = nil;
    
    [super dealloc];
}

@end
