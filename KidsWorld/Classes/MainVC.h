/*!
 @class MainVC
 @superclass UIViewController
 @abstract Will show Alphabets scrollview.
 
 @author     : Ketan Parekh
 Modified by : Pradnya Mankar
 @discussion Created: 25/09/12
 @updated 04/10/2012
 */

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "AppDelegate.h"
#import "iAd/iAd.h"
#import <iAd/ADBannerView_Deprecated.h>
#import "iAd/ADBannerView.h"

@protocol AlphabetDelegate <NSObject>

-(void) playSound:(NSDictionary *)_alphabet;
-(void) showViewForWriting:(NSDictionary *)_char;

@end

@interface MainVC : UIViewController  <AVAudioPlayerDelegate, ADBannerViewDelegate, UIScrollViewDelegate, AlphabetDelegate>
{
    int counter;

    // Audio
    AVAudioPlayer *audioPlayer;
    //UISlider *volumeControl;
    //UILabel *timerLabel;
    //BOOL Playing;
}

//@property (nonatomic, retain) IBOutlet UISlider *volumeControl;
//@property (nonatomic, retain) IBOutlet UILabel *timerLabel;
@property (nonatomic, retain) IBOutlet ADBannerView *adView;
@property (nonatomic, retain) IBOutlet UIScrollView *scroll;
@property (nonatomic, retain) IBOutlet UIButton *btnPrevious;
@property (nonatomic, retain) IBOutlet UIButton *btnNext;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) NSArray *alphabets;

@property (nonatomic, retain) NSString *sectionName;
@property (nonatomic)BOOL isiAdLoaded;

-(IBAction)BtnHomeClick:(id)sender;
-(IBAction)BtnNextClick:(id)sender;
-(IBAction)BtnPreviousClick:(id)sender;

-(IBAction)ReplaySoundClick:(id)sender;

@end
