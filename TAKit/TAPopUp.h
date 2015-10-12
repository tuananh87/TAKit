//
//  TAPopup.h
//  TIMO_PROJECT
//
//  Created by Tuan Anh on 5/26/15.
//  Copyright (c) 2015 MMSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TAPopUp : NSObject

- (instancetype)initWithContentViewController:(UIViewController*)contentViewController;
- (void)show;
- (void)hide;
- (void)hideWithDelay:(NSTimeInterval)delay withCompleteBlock:(void(^)())complete;

@property (nonatomic) UIWindowLevel windowLevel;

@end
