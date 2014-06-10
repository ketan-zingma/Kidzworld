//
//  Alphabet.h
//  BezierDrawing
//
//  Created by Pradnya Mankar on 08/10/12.
//  Copyright (c) 2012 Pradnya Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alphabet : UIView

@property (nonatomic, retain) UIBezierPath *alphabetPath;
@property (nonatomic, readwrite) char alphabetChar;
@property (nonatomic, readwrite) BOOL step1Completed;
@property (nonatomic, readwrite) BOOL step2Completed;
@property (nonatomic, readwrite) BOOL step3Completed;
@property (nonatomic, readwrite) BOOL step4Completed;

+ (UIBezierPath *) pathForAlphabet:(char)c;
- (BOOL) checkPath:(UIBezierPath *)path forAlphabet:(char)c;
+ (BOOL) canReStartDrawingAlphabet:(char)c fromPoint:(CGPoint)point;

- (CGPoint) startingAtPoint;
//- (BOOL) canAlphabetStartAtPoint:(CGPoint) point;

+ (UIBezierPath *) subpath1ForAlphabet:(char)c;
+ (UIBezierPath *) subpath2ForAlphabet:(char)c;
+ (UIBezierPath *) subpath3ForAlphabet:(char)c;
+ (UIBezierPath *) subpath4ForAlphabet:(char)c;

@end
