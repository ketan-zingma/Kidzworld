//
//  ViewController.h
//  BezierDrawing
//
//  Created by Pradnya Mankar on 08/10/12.
//  Copyright (c) 2012 Pradnya Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alphabet.h"
#import "MainVC.h"

#import "QuartzCore/QuartzCore.h"

@interface WritingViewController : UIViewController <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
    NSObject<AlphabetDelegate> *delegate;
    NSInteger counter;
}

@property (nonatomic, retain) IBOutlet UIImageView *imgViewDrawing;
@property (nonatomic, retain) IBOutlet UIImageView *imgPencilTip;
@property (nonatomic, retain) IBOutlet UIButton *btnBack;
@property (nonatomic, retain) IBOutlet UIButton *btnPrevious;
@property (nonatomic, retain) IBOutlet UIButton *btnNext;
@property (nonatomic, retain) IBOutlet UIButton *btnHome;
@property (nonatomic, retain) IBOutlet UIButton *btnBackToLetter;
@property (nonatomic, retain) IBOutlet UILabel *lblAlphabet;
@property (nonatomic, retain) Alphabet *alphabetView;

@property (nonatomic, retain) NSArray *alphabets;
@property (nonatomic, retain) NSDictionary *dicAlphabet;

@property (nonatomic, retain) UIBezierPath *alphabetPath;
@property (nonatomic, retain) UIBezierPath *alphabetSubpath;
@property (nonatomic, retain) UIBezierPath *currentPath;
@property (nonatomic, readwrite) char alphabetChar;
@property (nonatomic, readwrite) CGPoint touchPoint;
@property (nonatomic, readwrite) CGPoint lastPoint;
@property (nonatomic, readwrite) BOOL shouldDraw;
@property (nonatomic, readwrite) BOOL isInitialTouch;
@property (nonatomic, readwrite) BOOL isSingleAlphabet;

- (void) setDelegate:(NSObject<AlphabetDelegate> *)_delegate;

@end
