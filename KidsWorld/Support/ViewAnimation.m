/*!
 @class ViewAnimation
 @superclass 
 @abstract 
 @author Ketan Parekh
 */
// Desc = This class contains implementation of methods which is developed to apply different animation effects on view

#import "ViewAnimation.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewAnimation ()
+ (NSString *)getSelectedAnimationTypeStringForType:(animationType)type;
+ (NSString *)getDirectionStringForSelectedDirection:(animationDirection)direction;
+ (void) attachPopUpAnimationToView:(UIView *)view;
@end
@implementation ViewAnimation

/**
 * addAnimationType: toView:
 * @desc adds selected typed animation to the view
 * @param animation type - animation type enum
 * @param view - UIView object on which animation will be applied
 */
+ (void)addAnimationType:(animationType)type toView:(UIView *)view withDirection:(animationDirection)direction andDuration:(float)duration
{
    if(type==viewAnimationTypePopUp)
    {
        [ViewAnimation attachPopUpAnimationToView:view];
    }
    else
    {
        CATransition *animation = [CATransition animation];
        [animation setDuration:duration];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        animation.subtype = [ViewAnimation getDirectionStringForSelectedDirection:direction];
        animation.type = [ViewAnimation getSelectedAnimationTypeStringForType:type];
        [animation setRemovedOnCompletion:YES];
        [[view layer] addAnimation:animation forKey:@"Animation"];
    }
}
/**
 * getDirectionStringForSelectedDirection()
 * @desc returns animation direction string according to enum type
 * @param type - animation direction enum
 */
+ (NSString *)getDirectionStringForSelectedDirection:(animationDirection)direction
{   
    switch (direction) {
        case 0:
            return @"fromRight";
            break;
        case 1:
            return @"fromLeft";
            break;
        case 2:
            return @"fromTop";
            break;
        case 3:
            return @"fromBottom";
            break;
        default:
            return @"fromRight";
            break;
    }

}
/**
 * getSelectedAnimationTypeStringForType()
 * @desc returns animation type string according to enum type
 * @param type - animation type enum
 */
+ (NSString *)getSelectedAnimationTypeStringForType:(animationType)type
{
    switch (type) {
        case 0:
            return @"flip";
            break;
        case 1:
            return @"fade";
            break;
        case 2:
            return @"pageCurl";
            break;
        case 3:
            return @"push";
            break;
        case 4:
            return @"reveal";
            break;
        case 5:
            return @"suckEffect";
            break;
        case 6:
            return @"rippleEffect";
            break;
        case 7:
            return @"cameraIris";
            break;
        default:
            return @"push";
            break;
    }
}

/**
 * attachPopUpAnimationToView()
 * @desc adds popup animation to the view
 * @param view on which pop up animation willl be applied
 */
+ (void) attachPopUpAnimationToView:(UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];    
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .3;
    
    [view.layer addAnimation:animation forKey:@"popup"];
}
@end
