/*!
 @class HomeVC
 @superclass UIViewController
 @abstract App Home screen.
 
 @author     : Ketan Parekh
 Modified by : Pradnya Mankar
 @discussion Created: 25/09/12
 @updated 04/10/2012
 */

#import "HomeVC.h"
#import "MainVC.h"
#import "ViewAnimation.h"
#import "WritingViewController.h"

@interface HomeVC ()

@end

@implementation HomeVC

@synthesize adView;
@synthesize isiAdLoaded;

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
    
    //self.adView = [[ADBannerView alloc] init];
    [self.adView setDelegate:self];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.adView.delegate = nil;
    [self.adView removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods 
/*!
 @method BtnFruitsClick:
 @abstract It is an instance method.
 @discussion This method will show fruits for each alphabet
 */
-(IBAction)BtnFruitsClick:(id)sender
{
    MainVC *objMainVC = [[[MainVC alloc] initWithNibName:@"MainVC" bundle:nil] autorelease];
    [ViewAnimation addAnimationType:viewAnimationTypeRippleEffect toView:self.navigationController.view withDirection:viewAnimationDirectionFromBottom andDuration:2.0];
    objMainVC.sectionName = @"Fruits";
    [self.navigationController pushViewController:objMainVC animated:YES];
}
/*!
 @method BtnAnimalsClick:
 @abstract It is an instance method.
 @discussion This method will show animals for each alphabet
 */
-(IBAction)BtnAnimalsClick:(id)sender
{
    MainVC *objMainVC = [[[MainVC alloc] initWithNibName:@"MainVC" bundle:nil] autorelease];
    [ViewAnimation addAnimationType:viewAnimationTypeRippleEffect toView:self.navigationController.view withDirection:viewAnimationDirectionFromBottom andDuration:2.0];
    objMainVC.sectionName = @"Animals";
    [self.navigationController pushViewController:objMainVC animated:YES];
}

- (IBAction) writingAction:(id)sender
{
    WritingViewController *writingVC = [[[WritingViewController alloc] initWithNibName:@"WritingViewController_iPhone" bundle:nil] autorelease];
    [ViewAnimation addAnimationType:viewAnimationTypeRippleEffect toView:self.navigationController.view withDirection:viewAnimationDirectionFromBottom andDuration:2.0];
    [self.navigationController pushViewController:writingVC animated:YES];
}

#pragma mark - Auto Rotate
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark iAdBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    //NSLog(@"iAd Loaded   ");
    isiAdLoaded = YES;
    adView.hidden = FALSE;
    //[self.adView setFrame:CGRectMake(0, 498, 320, 50)];
    [self.view addSubview:self.adView];
    [UIView beginAnimations:nil context:NULL];
    [self.adView setFrame:CGRectMake(0,550, 320, 50)];
    [UIView setAnimationDuration:0.3];
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    if(result.height == 480)
    {
        [self.adView setFrame:CGRectMake(0,410, 320, 50)];
    }
    
    if(result.height == 568)
    {
        [self.adView setFrame:CGRectMake(0, 498, 320, 50)];
    }
    //viewContainer.frame = CGRectMake(0, 0, ContainerViewWidthForiPhone, ContainerViewWithiAdHeightForiPhone);
    [UIView commitAnimations];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    //NSLog(@"iAd LoadingFailed");
    adView.hidden = TRUE;
    isiAdLoaded = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [self.adView removeFromSuperview];
    //viewContainer.frame = CGRectMake(0, 0, ContainerViewWidthForiPhone, ContainerViewDefaultHeightForiPhone);
    [UIView commitAnimations];
}

#pragma mark - Memory management

- (void)dealloc
{
    self.adView = nil;
    self.adView.delegate = nil;
    [super dealloc];
}

@end
