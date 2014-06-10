//
//  ViewController.m
//  BezierDrawing
//
//  Created by Pradnya Mankar on 08/10/12.
//  Copyright (c) 2012 Pradnya Mankar. All rights reserved.
//

#import "WritingViewController.h"
#import "ViewAnimation.h"

#define ALPHABET_TAG        10
#define RESULT_VIEW_TAG     11
#define TRANSPARENTVIEW_TAG 12

@interface WritingViewController ()
- (IBAction) clearDrawing;
- (IBAction) checkDrawing;
@end

@implementation WritingViewController

@synthesize imgViewDrawing, imgPencilTip, alphabetView;
@synthesize touchPoint, lastPoint, btnBack, dicAlphabet;
@synthesize alphabetChar, alphabetPath, alphabetSubpath, currentPath;
@synthesize btnHome, btnNext, btnPrevious, lblAlphabet;
@synthesize isSingleAlphabet, isInitialTouch, alphabets, btnBackToLetter;

- (void) initialize
{
    if( self.isSingleAlphabet )  {
    
        [self.btnPrevious setHidden:YES];
        [self.btnHome setHidden:YES];
        [self.btnNext setHidden:YES];
    }
    else  {
        self.alphabetChar = 'A';
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Writing" ofType:@"plist"];
        self.alphabets = [NSArray arrayWithContentsOfFile:plistPath];
        counter = 0;
        
        CGRect frame = self.lblAlphabet.frame;
        frame.origin.x = 28;
        self.lblAlphabet.frame = frame;
        [self.btnBackToLetter setHidden:YES];
    }
    
    self.currentPath = [UIBezierPath bezierPath];
    self.currentPath.lineWidth = LINE_WIDTH;
    self.currentPath.lineCapStyle = kCGLineCapRound;
    
    [self.btnBack setTitle:[NSString stringWithFormat:@"%c", self.alphabetChar] forState:UIControlStateNormal];
    
    self.isInitialTouch = YES;
}

- (void) setDelegate:(NSObject<AlphabetDelegate> *)_delegate
{
    delegate = _delegate;
}

- (IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) showAlphabet
{
    CGRect frame = CGRectMake(0, 95, 320, 265);
    self.alphabetView = [[Alphabet alloc] initWithFrame:frame];
    self.alphabetView.alphabetChar = self.alphabetChar;
    self.alphabetPath = [Alphabet pathForAlphabet: self.alphabetChar];
    self.alphabetSubpath = [self subpathForAlphabet];
    
//    [self.alphabetView setTag:ALPHABET_TAG];
    [self.view addSubview: self.alphabetView];
    
    [self.view bringSubviewToFront: self.imgViewDrawing];
    [self.imgViewDrawing setFrame:frame];
    
    if( !isSingleAlphabet ) {
        
        if( self.alphabetChar == 65 )   {
            [self.btnPrevious setEnabled:NO];
        }
        else    {
            [self.btnPrevious setEnabled:YES];
        }
        if( self.alphabetChar == 90 )   {
            [self.btnNext setEnabled:NO];
        }
        else    {
            [self.btnNext setEnabled:YES];
        }
        self.dicAlphabet = [self.alphabets objectAtIndex:counter];
    }
    [self.lblAlphabet setText:[self.dicAlphabet objectForKey:@"alphabet"]];
    
//    if( self.alphabetChar == 'C' )  {
        [self drawingAnimation];
//    }
}

- (void) removePauseForLayer: (CALayer *) theLayer;
{
    theLayer.speed = 1.0;
    theLayer.timeOffset = 0.0;
    theLayer.beginTime = 0.0;
}

#pragma mark - Animation

- (void) drawingAnimation
{
    [self.imgViewDrawing addSubview:self.imgPencilTip];
    
    // Show pencil tip
    self.imgPencilTip.center = [self.alphabetView startingAtPoint];
    [self.imgPencilTip setHidden:NO];
    
    // Animation : Tracing the alphabet
    CAKeyframeAnimation* trace = nil;
    trace = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    trace.removedOnCompletion = NO;
    trace.fillMode = kCAFillModeForwards;
    trace.duration = TRACING_ANIMATION_DURATION;
    trace.beginTime = 0;
    trace.repeatCount = 1;
    trace.autoreverses = NO;
    trace.delegate = self;
    //trace.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    trace.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //[trace setPath: self.alphabetPath.CGPath];
    [trace setPath:self.alphabetSubpath.CGPath];
    
    [self.imgPencilTip.layer addAnimation:trace forKey:@"trace"];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    //[self.view setUserInteractionEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)isFinished
{
    if( isFinished )    {
        //[self.view setUserInteractionEnabled:YES];
        [self.imgPencilTip setHidden:YES];
        [self.imgPencilTip.layer removeAllAnimations];
    }
}

- (IBAction) showPrevAlphabet
{
    [self clearDrawing];
    [self.alphabetView removeFromSuperview];
    self.alphabetView = nil;
    
    NSInteger intAlphabetValue = (int) self.alphabetChar;
    self.alphabetChar = (char) --intAlphabetValue;
    counter--;
    //NSLog(@"int:%d\tchar:%c", intAlphabetValue, self.alphabetChar);
    [self showAlphabet];
}

- (IBAction) showNextAlphabet
{
    [self clearDrawing];
    [self.alphabetView removeFromSuperview];
    self.alphabetView = nil;
    
    NSInteger intAlphabetValue = (int) self.alphabetChar;
    self.alphabetChar = (char) ++intAlphabetValue;
    counter++;
    //NSLog(@"int:%d\tchar:%c", intAlphabetValue, self.alphabetChar);
    [self showAlphabet];
}

- (void) addTransparentViewOnView:(UIView *)aView
{
    UIView *transparentView = [[[UIView alloc] initWithFrame:self.view.frame] autorelease];
    [transparentView setBackgroundColor:[UIColor blackColor]];
    [transparentView setAlpha:0.65];
    [transparentView setTag:TRANSPARENTVIEW_TAG];
    //[self.window addSubview:transparentView];
    [aView addSubview:transparentView];
}

- (void) removeTransparentView
{
    [[self.view viewWithTag:TRANSPARENTVIEW_TAG] removeFromSuperview];
}

- (void) removeResultView
{
    UIView *lblResult = [self.view viewWithTag:RESULT_VIEW_TAG];
    [lblResult removeFromSuperview];
    [lblResult release];
    
    [self removeTransparentView];
    [self.view setUserInteractionEnabled:YES];
}

/*!
 @method playSound
 @description Prepare path for sound file and play it.
 @result Prepare path for sound file and play it.
 */
-(void) playSound:(NSDictionary *)currentAlphabet
{
    if( !audioPlayer.isPlaying )
    {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[currentAlphabet objectForKey:@"sound"] ofType:@""]];
        NSError *error;
        if(audioPlayer != nil)
            [audioPlayer release];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (error)
        {
            //NSLog(@"Error in audioPlayer: %@",[error localizedDescription]);
        }
        else
        {
            audioPlayer.delegate = self;
            audioPlayer.numberOfLoops = 0;
            [audioPlayer prepareToPlay];
        }
        [audioPlayer play];
    }
}

- (void) showResult:(BOOL)isCorrect
{
    [self.view setUserInteractionEnabled:NO];
    
    if( self.isSingleAlphabet ) {
        
        if( [delegate respondsToSelector:@selector(playSound:)] )   {
            [delegate playSound:self.dicAlphabet];
        }
    }
    else    {
        [self playSound:self.dicAlphabet];
    }
    
    [self addTransparentViewOnView:self.view];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"correct.png"]];
    [imgView setFrame:CGRectMake(0, 0, 150, 150)];
    [[imgView layer] setCornerRadius:10];
    [imgView setTag:RESULT_VIEW_TAG];
    imgView.center = self.view.center;

    [ViewAnimation addAnimationType:viewAnimationTypePopUp toView:imgView withDirection:viewAnimationDirectionFromTop andDuration:1];
    [self.view addSubview:imgView];
    
    [self performSelector:@selector(removeResultView) withObject:nil afterDelay:3];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch ( buttonIndex ) {
        case 0:
            [self showNextAlphabet];
            break;
            
        default:
            break;
    }
}

- (UIBezierPath *) subpathForAlphabet
{
    char c = self.alphabetChar;
    UIBezierPath *subpath = nil;
    
    if( !self.alphabetView.step1Completed ) {
        subpath = [Alphabet subpath1ForAlphabet: c];
    }
    else if ( !self.alphabetView.step2Completed )   {
        subpath = [Alphabet subpath2ForAlphabet: c];
    }
    else if ( !self.alphabetView.step3Completed )   {
        subpath = [Alphabet subpath3ForAlphabet: c];
    }
    else if ( !self.alphabetView.step4Completed )   {
        subpath = [Alphabet subpath4ForAlphabet: c];
    }
    
    //NSLog(@"subpath : %@", subpath);
    return subpath;
}

#pragma mark - Button Action

- (IBAction) homeAction {
    
    [ViewAnimation addAnimationType:viewAnimationTypeFlip toView:self.navigationController.view withDirection:viewAnimationDirectionFromRight andDuration:1.0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) clearDrawing {
    
    imgViewDrawing.image = nil;
    [self.currentPath removeAllPoints];
    
    self.isInitialTouch = YES;
    self.alphabetView.step1Completed = NO;
    self.alphabetView.step2Completed = NO;
    self.alphabetView.step3Completed = NO;
    self.alphabetView.step4Completed = NO;
    self.alphabetSubpath = [self subpathForAlphabet];
}

- (IBAction) checkDrawing {
    
    //NSLog(@"self.currentPath: %@", self.currentPath);
    BOOL isCorrectPath = NO;
    isCorrectPath = [self.alphabetView checkPath:self.currentPath forAlphabet: self.alphabetChar];
    if( isCorrectPath ) {
        [self showResult:isCorrectPath];
    }
    else    {
        self.alphabetSubpath = [self subpathForAlphabet];
        [self drawingAnimation];
    }
    
    self.isInitialTouch = YES;  // For every subpath's initial point
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self.imgViewDrawing setHidden:YES];
    
    [self initialize];
    [self showAlphabet];
    
    [[self.btnBack layer] setCornerRadius:5];
    [[self.btnBack layer] setBorderWidth:2];
    [[self.btnBack layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.btnBack layer] setMasksToBounds:YES];
}

- (BOOL) isPoint:(CGPoint)point1 EqualToPoint:(CGPoint)point2
{
    ComparePoints(point1, point2)
}

#pragma mark - Touch delegates

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    [self.imgPencilTip setHidden:YES];
    [self.imgPencilTip.layer removeAllAnimations];
    
	UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:imgViewDrawing];
    
    //self.alphabetSubpath = [self subpathForAlphabet];
    UIBezierPath *path = self.alphabetSubpath;
    if( path == nil )   {
        lastPoint = touchPoint;
        self.shouldDraw = NO;
        return;
    }
    //NSLog(@"shouldDraw");
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, kCGLineCapRound, path.lineJoinStyle, MITER_LIMIT);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    BOOL pointLiesOnPath = [path containsPoint:touchPoint];

    if( pointLiesOnPath )
    {
        //BOOL isStartingPointCorrect = [self.alphabetView canAlphabetStartAtPoint:touchPoint];
        CGPoint startingPoint = [self.alphabetView startingAtPoint];
        BOOL isStartingPointCorrect = [self isPoint:touchPoint EqualToPoint:startingPoint];
        if( self.isInitialTouch && isStartingPointCorrect ) {
            self.shouldDraw = YES;
        }
        else
        {
            path = self.currentPath;
            CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, path.lineCapStyle, path.lineJoinStyle, MITER_LIMIT);
            path = [UIBezierPath bezierPathWithCGPath:cgPath];
            CGPathRelease(cgPath);
            BOOL pointLiesOnDrawnPath = [path containsPoint:touchPoint];
            BOOL isLastPoint = [self isPoint:touchPoint EqualToPoint:lastPoint];
            //NSLog(@"isLastPoint: %d touch:(%.2f,%.2f) last:(%.2f,%.2f)",isLastPoint, touchPoint.x,touchPoint.y,lastPoint.x,lastPoint.y);
            if( pointLiesOnDrawnPath && isLastPoint && self.isInitialTouch )  {
                self.shouldDraw = YES;
            }
            else {
                BOOL canReStartFromThisPoint = [Alphabet canReStartDrawingAlphabet:self.alphabetChar
                                                                         fromPoint:touchPoint];
                if( canReStartFromThisPoint )   {
                    self.shouldDraw = YES;
                }
                else    {
                    lastPoint = touchPoint;
                    self.shouldDraw = NO;
                }
            }
        }
    }
    else    {
        lastPoint = touchPoint;
        self.shouldDraw = NO;
    }
    CGPathRelease(cgPath);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if( !self.shouldDraw )  {
        return;
    }
    
    self.isInitialTouch = NO;
    
	UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:imgViewDrawing];
	//currentPoint.y -= 2;
	
    UIBezierPath *path = self.alphabetSubpath; //[self subpathForAlphabet];
    CGPathRef cgPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, TOUCH_WIDTH, kCGLineCapRound, path.lineJoinStyle, MITER_LIMIT);
    path = [UIBezierPath bezierPathWithCGPath:cgPath];
    CGPathRelease(cgPath);
    //    path.lineWidth = 50;
    BOOL pointLiesOnPath = [path containsPoint:currentPoint];
    //NSLog(@"on path : %d", pointLiesOnPath);
    if( pointLiesOnPath)
    {
        UIGraphicsBeginImageContext(imgViewDrawing.frame.size);
        [imgViewDrawing.image drawInRect:CGRectMake(0, 0, imgViewDrawing.frame.size.width, imgViewDrawing.frame.size.height)];
        
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), LINE_WIDTH);
        //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.83, 0.65, 0.66, 1.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        
        /*/---- to check point on path
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 208.81, 68.69);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 208.81, 68.69);
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 160.0, 50.0);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 160.0, 50.0);
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 114, 68.69);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 114, 68.69);
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 85.5, 130.0);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 85.5, 130.0);

        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 109, 188.07);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 109, 188.07);

        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 234.81, 128.69);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 234.81, 128.69);
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 160.0, 210.0);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 160.0, 210.0);
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 210, 190.0);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 210, 190.0);
        //----*/
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        imgViewDrawing.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        /* // working on 5.1 above
        UIBezierPath *touchedPath = [UIBezierPath bezierPath];
        touchedPath.lineWidth = LINE_WIDTH;
        touchedPath.lineCapStyle = kCGLineCapRound;
        [touchedPath moveToPoint: lastPoint];
        [touchedPath addLineToPoint: currentPoint];
        [self.currentPath appendPath:touchedPath];*/
        
        [self.currentPath moveToPoint: touchPoint];
        [self.currentPath addLineToPoint:currentPoint];
        
        touchPoint = currentPoint;
    }
    else    {
        lastPoint = touchPoint;
        self.shouldDraw = NO;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
    [self checkDrawing];
    
    if( self.shouldDraw )   {
        UITouch *touch = [touches anyObject];
        lastPoint = [touch locationInView:imgViewDrawing];
        //NSLog(@"touchesEnded: lastPoint(%.2f,%.2f)", lastPoint.x, lastPoint.y);
        self.isInitialTouch = YES;
    }
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    self.dicAlphabet = nil;
    
    [super dealloc];
}

@end
