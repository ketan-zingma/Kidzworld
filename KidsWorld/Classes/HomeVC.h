/*!
 @class HomeVC
 @superclass UIViewController
 @abstract App Home screen.
 
 @author     : Ketan Parekh
 Modified by : Pradnya Mankar
 @discussion Created: 25/09/12
 @updated 04/10/2012
 */

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "iAd/iAd.h"
#import "iAd/ADBannerView.h"
#import <iAd/ADBannerView_Deprecated.h>

@interface HomeVC : UIViewController <ADBannerViewDelegate>

@property (nonatomic, retain) IBOutlet ADBannerView *adView;
@property (nonatomic) BOOL isiAdLoaded;

- (IBAction)BtnFruitsClick:(id)sender;
- (IBAction)BtnAnimalsClick:(id)sender;

@end
