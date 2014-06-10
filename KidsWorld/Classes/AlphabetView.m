//
//  AlphabetView.m
//  KidsWorld
//
//  Created by Pradnya Mankar on 03/10/12.
//  Copyright (c) 2012 Ketan Parekh. All rights reserved.
//

#import "AlphabetView.h"

@interface AlphabetView ()

@end

@implementation AlphabetView

@synthesize imgAlphabet, lblAlphabet, lblName, btnSound;
@synthesize alphabet;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setDelegate:(NSObject<AlphabetDelegate> *)_delegate
{
    delegate = _delegate;
}

- (void) callPlaySound
{
    if( [delegate respondsToSelector:@selector(playSound:)] )   {
    
        [delegate playSound:self.alphabet];
    }
}

- (IBAction) showWritingView
{
    if( [delegate respondsToSelector:@selector(showViewForWriting:)] )   {
        
        [delegate showViewForWriting:self.alphabet];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];

    [self.imgAlphabet setImage:[UIImage imageNamed:[self.alphabet objectForKey:@"image"]]];
    [self.lblAlphabet setText:[self.alphabet objectForKey:@"alphabet"]];
    [self.lblName setText:[self.alphabet objectForKey:@"name"]];
    [self.btnSound addTarget:self action:@selector(callPlaySound) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    self.imgAlphabet = nil;
    self.lblName = nil;
    self.lblAlphabet = nil;
    self.btnSound = nil;
    
    [super dealloc];
}

@end
