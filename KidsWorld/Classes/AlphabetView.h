//
//  AlphabetView.h
//  KidsWorld
//
//  Created by Pradnya Mankar on 03/10/12.
//  Copyright (c) 2012 Ketan Parekh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainVC.h"

@interface AlphabetView : UIViewController  {

    NSObject<AlphabetDelegate> *delegate;
}

@property (nonatomic, retain) IBOutlet UIImageView *imgAlphabet;
@property (nonatomic, retain) IBOutlet UILabel *lblAlphabet;
@property (nonatomic, retain) IBOutlet UILabel *lblName;
@property (nonatomic, retain) IBOutlet UIButton *btnSound;

@property (nonatomic, retain) NSDictionary *alphabet;

- (void) setDelegate:(NSObject<AlphabetDelegate> *)_delegate;
- (void) callPlaySound;

@end
