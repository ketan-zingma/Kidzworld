//
//  SplashVC.m
//  KidsWorld
//
//  Created by Ketan Parekh on 24/09/12.
//  Copyright (c) 2012 Ketan Parekh. All rights reserved.
//

#import "SplashVC.h"
#import "HomeVC.h"
#import "ViewAnimation.h"
@interface SplashVC ()

@end

@implementation SplashVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = true;
    [self performSelector:@selector(PushMain) withObject:nil afterDelay:3.0];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Auto Rotate
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - Methods and Action
/*!
 @method PushMain
 @discussion Navigate to home view with animation
 @result Navigate to home view with animation
 */
- (void)PushMain
{
    HomeVC *objHomeVC = [[[HomeVC alloc] initWithNibName:@"HomeVC" bundle:nil] autorelease];
    [ViewAnimation addAnimationType:viewAnimationTypeFlip toView:self.navigationController.view withDirection:viewAnimationDirectionFromTop andDuration:1.0];
    [self.navigationController pushViewController:objHomeVC animated:YES];
    
}
@end
