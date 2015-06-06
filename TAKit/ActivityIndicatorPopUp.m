//
//  ActivityIndicatorPopup.m
//  TIMO_PROJECT
//
//  Created by Tuan Anh on 6/3/15.
//  Copyright (c) 2015 MMSOFT. All rights reserved.
//

#import "ActivityIndicatorPopUp.h"
#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorPopUp(){
    
}


@end

@implementation ActivityIndicatorPopUp

- (instancetype)init
{
    self = [super initWithContentViewController:[ActivityIndicatorViewController new]];
    if (self) {

    }
    return self;
}

- (void)hide{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(show) object:nil];
    [super hide];
}

@end
