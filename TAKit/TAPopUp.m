//
//  TAPopup.m
//  TIMO_PROJECT
//
//  Created by Tuan Anh on 5/26/15.
//  Copyright (c) 2015 MMSOFT. All rights reserved.
//

#import "TAPopUp.h"
#import "UIViewController+TAPopup.h"

@interface TAPopUp()

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIWindow *popupWindow;
@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) id retainMe;

@end

@implementation TAPopUp

- (instancetype)initWithContentViewController:(UIViewController*)contentViewController
{
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
    }
    return self;
}

#pragma mark - properties

- (UIWindow *)popupWindow{
    if (!_popupWindow) {
        _popupWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _popupWindow.windowLevel = (UIWindowLevelAlert + UIWindowLevelNormal)/2;
    }
    return _popupWindow;
}

- (UIViewController *)rootViewController{
    if (!_rootViewController) {
        _rootViewController = [UIViewController new];
        [[self popupWindow] setRootViewController:_rootViewController];
        [_rootViewController.view setBackgroundColor:[UIColor clearColor]];
    }
    return _rootViewController;
}

- (void)show{
    if (!self.contentViewController.view.superview) {
        CGRect bounds = self.rootViewController.view.bounds;
        self.contentViewController.view.frame = bounds;
        self.contentViewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        [self.rootViewController.view addSubview:self.contentViewController.view];
    }
    
    [self.popupWindow makeKeyAndVisible];
    self.retainMe = self;
    self.contentViewController.popUp = self;
}

- (void)hide{
    [self.contentViewController.view removeFromSuperview];
    self.contentViewController.popUp = nil;
    [self.popupWindow resignKeyWindow];
    self.popupWindow = nil;
    self.retainMe = nil;
    
}

- (void)dealloc{
    NSLog(@"dealloc %@", self);
}

- (void)hideWithDelay:(NSTimeInterval)delay withCompleteBlock:(void(^)())complete{
    [self.rootViewController.view setUserInteractionEnabled:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (complete) {
            complete();
        }
        [self hide];
    });
}

@end
