/*!
 @class ViewAnimation
 @superclass 
 @abstract 
 @author Ketan Parekh
 */

#import <Foundation/Foundation.h>

typedef enum
{
    viewAnimationTypeFlip = 0,
    viewAnimationTypeFade,
    viewAnimationTypePageCurl,
    viewAnimationTypePush,
    viewAnimationTypeReveal,
    viewAnimationTypeSuckEffect,
    viewAnimationTypeRippleEffect,
    viewAnimationTypeCameraIris,
    viewAnimationTypePopUp
}
animationType;

typedef enum
{
    viewAnimationDirectionFromRight = 0,
    viewAnimationDirectionFromLeft,
    viewAnimationDirectionFromTop,
    viewAnimationDirectionFromBottom,
}
animationDirection;
@interface ViewAnimation : NSObject
+ (void)addAnimationType:(animationType)type toView:(UIView *)view withDirection:(animationDirection)direction andDuration:(float)duration;

@end
