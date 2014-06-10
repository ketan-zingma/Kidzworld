/*!
 @class MainVC
 @superclass UIViewController
 @abstract Will show Alphabets scrollview.
 
 @author        : Ketan Parekh
    Modified by : Pradnya Mankar
 @discussion Created: 25/09/12
 @updated 04/10/2012
 */

#import "MainVC.h"
#import "ViewAnimation.h"
#import "AlphabetView.h"
#import "WritingViewController.h"

@interface MainVC ()

@end

@implementation MainVC

@synthesize sectionName;
@synthesize adView, scroll, btnPrevious, btnNext;
@synthesize isiAdLoaded, viewControllers, alphabets;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*!
 @method initialize
 @abstract It is an instance method.
 @discussion This method will initialize collections
 */
- (void) initialize
{
    self.viewControllers = [NSMutableArray array];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource: self.sectionName ofType:@"plist"];
    self.alphabets = [NSArray arrayWithContentsOfFile:plistPath];
    //NSLog(@"self.alphabets : %@", self.alphabets);
}

/*!
 @method setupImageScroll
 @abstract It is a instance method.
 @discussion Set up for scrollview for images. Imageviews are added lazily and images are downloaded lazily
 */
- (void) setupScroll
{
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self.alphabets count]; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [controllers release];
    
    // a page is the width of the scroll view
    self.scroll.pagingEnabled = YES;
    self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width * [self.alphabets count], self.scroll.frame.size.height);
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.showsVerticalScrollIndicator = NO;
    self.scroll.scrollsToTop = NO;
    self.scroll.delegate = self;
    [self.scroll setBackgroundColor:[UIColor clearColor]];
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    counter = 0;
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    [self.btnPrevious setEnabled:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // iAd
    //self.adView = [[ADBannerView alloc] init];
    [self.adView setDelegate:self];
    
    [self initialize];
    [self setupScroll];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSelector:@selector(playSound:) withObject:[self.alphabets objectAtIndex:counter] afterDelay:0.5];
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.adView.delegate = nil;
    [self.adView removeFromSuperview];
    self.adView = nil;
    audioPlayer.delegate = nil;
}

#pragma mark - Private Methods

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

-(void) showViewForWriting:(NSDictionary *)dicAlphabet
{
    WritingViewController *writingVC = [[[WritingViewController alloc] initWithNibName:@"WritingViewController_iPhone" bundle:nil] autorelease];
    writingVC.dicAlphabet = dicAlphabet;
    writingVC.isSingleAlphabet = YES;
    NSString *strAlphabet = [dicAlphabet objectForKey:@"alphabet"];
    char c = (char)[strAlphabet characterAtIndex:0];
    writingVC.alphabetChar = c;
    writingVC.delegate = self;
    [ViewAnimation addAnimationType:viewAnimationTypeFlip toView:self.navigationController.view withDirection:viewAnimationDirectionFromLeft andDuration:1.0];
    [self.navigationController pushViewController:writingVC animated:YES];
}

/*!
 @method BtnHomeClick
 @description Navigate to Home view.
 @result Navigate to Home view.
 */
-(IBAction)BtnHomeClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*!
 @method BtnPreviousClick
 @description Set Previous Alphabet name sound and Small , caps latter.
 @result Set Previous Alphabet name sound and Small , caps latter.
 */
-(IBAction)BtnPreviousClick:(id)sender
{
    if(counter > 0 && !audioPlayer.isPlaying)
    {
        counter--;
        [self loadScrollViewWithPage:counter];
        
        CGRect frame = self.scroll.frame;
        frame.origin.x = frame.size.width * counter;
        frame.origin.y = 0;
        [self.scroll scrollRectToVisible:frame animated:YES];
        
        [self performSelector:@selector(playSound:) withObject:[self.alphabets objectAtIndex:counter] afterDelay:0.1];
    }
    
    if( counter == 0 )  {
        [self.btnPrevious setEnabled:NO];
        [self.btnNext setEnabled:YES];
    }
    if( counter > 0 && counter < [self.alphabets count]-1 ) {
        [self.btnPrevious setEnabled:YES];
        [self.btnNext setEnabled:YES];
    }
}

/*!
 @method BtnNextClick
 @description Set Next Alphabet name sound and Small , caps latter.
 @result Set Next Alphabet name sound and Small , caps latter.
 */
-(IBAction)BtnNextClick:(id)sender
{
    if(counter < 25 && !audioPlayer.isPlaying)
    {
        counter++;
        [self loadScrollViewWithPage:counter];
        
        CGRect frame = self.scroll.frame;
        frame.origin.x = frame.size.width * counter;
        frame.origin.y = 0;
        [self.scroll scrollRectToVisible:frame animated:YES];
        [self performSelector:@selector(playSound:) withObject:[self.alphabets objectAtIndex:counter] afterDelay:0.1];
    }
    
    if( counter == [self.alphabets count]-1 )  {
        [self.btnPrevious setEnabled:YES];
        [self.btnNext setEnabled:NO];
    }
    if( counter > 0 && counter < [self.alphabets count]-1 ) {
        [self.btnPrevious setEnabled:YES];
        [self.btnNext setEnabled:YES];
    }
}

/*!
 @method ReplaySoundClick
 @description Replay Alphabet sound.
 @result Replay Alphabet sound.
 */
-(IBAction)ReplaySoundClick:(id)sender
{
    if(!audioPlayer.isPlaying)
        [audioPlayer play];
}

#pragma mark - Audio Play delegate

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [player stop];
     //NSLog(@"%d AV FinishPlaying 2=====",audioPlayer.retainCount);
}

-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [player stop];
}

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    [player stop];
}

-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    [player stop];
}
// Vesrion check 
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags
{
    [player stop];
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withFlags:(NSUInteger)flags
{
    [player stop];
}

#pragma mark - auto rotate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark- Image Scroll

/*!
 @method loadScrollViewWithPage:
 @abstract It is a instance method.
 @discussion This method will load view for specified page
 @param Page number for which the view is to be loaded on scrollview
 */
- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= [self.alphabets count])
        return;
    
    //NSLog(@"page = %d\n%@", page, [self.alphabets objectAtIndex:page]);
    // replace the placeholder if necessary
    AlphabetView *alphabetView = [self.viewControllers objectAtIndex:page];
    UIActivityIndicatorView *activityIndicator = nil;
    if ((NSNull *)alphabetView == [NSNull null])
    {
        //CGRect frame = CGRectMake(0, 0, 320, self.scroll.frame.size.height);
        alphabetView = [[[AlphabetView alloc] initWithNibName:@"AlphabetView" bundle:nil] autorelease];
        [alphabetView setAlphabet:[self.alphabets objectAtIndex:page]];
        [alphabetView setDelegate:self];
        [self.viewControllers replaceObjectAtIndex:page withObject:alphabetView];
        //[alphabetView release];
    }
    
    // add the controller's view to the scroll view
    if (alphabetView.view.superview == nil)
    {
        CGRect frame = self.scroll.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        alphabetView.view.frame = frame;
        if( activityIndicator ) {
            activityIndicator.center = alphabetView.view.center;
            [activityIndicator startAnimating];
            [activityIndicator setTag:page];
        }
        [self.scroll addSubview:[alphabetView view]];
    }
}

#pragma mark - Scrollview delegates

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scroll.frame.size.width;
    counter = floor((self.scroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    //self.pageControlForImages.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:counter - 1];
    [self loadScrollViewWithPage:counter];
    [self loadScrollViewWithPage:counter + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    self.pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    self.pageControlUsed = NO;
    [self playSound:[self.alphabets objectAtIndex:counter]];
    
    if( counter == 0 )  {
        [self.btnPrevious setEnabled:NO];
        [self.btnNext setEnabled:YES];
    }
    if( counter == [self.alphabets count]-1 )  {
        [self.btnPrevious setEnabled:YES];
        [self.btnNext setEnabled:NO];
    }
    
    if( counter > 0 && counter < [self.alphabets count]-1 ) {
        [self.btnPrevious setEnabled:YES];
        [self.btnNext setEnabled:YES];
    }
}

#pragma mark - iAdBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    //NSLog(@"iAd Loaded  = Main ");
    isiAdLoaded = YES;
    [self.adView setFrame:CGRectMake(0,550, 320, 50)];
    [self.view addSubview:self.adView];
    [UIView beginAnimations:nil context:NULL];
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
    //NSLog(@"iAd LoadingFailed = Main");
    isiAdLoaded = NO;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [self.adView removeFromSuperview];
    //viewContainer.frame = CGRectMake(0, 0, ContainerViewWidthForiPhone, ContainerViewDefaultHeightForiPhone);
    [UIView commitAnimations];
}

#pragma mark- Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [audioPlayer release];
    
    [super dealloc];
}

@end
