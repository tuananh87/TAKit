//
//  UIViewController+TAPopup.m
//  TIMO_PROJECT
//
//  Created by Tuan Anh on 5/26/15.
//  Copyright (c) 2015 MMSOFT. All rights reserved.
//

#import "UIViewController+TAPopUp.h"
#import <objc/runtime.h>


@implementation UIViewController (TAPopUp)

static void *tapoupkey;

- (void)setPopUp:(TAPopUp *)popup{
    objc_setAssociatedObject(self, &tapoupkey, popup, OBJC_ASSOCIATION_ASSIGN);
}

- (TAPopUp *)popUp{
    TAPopUp *result = (TAPopUp *)objc_getAssociatedObject(self, &tapoupkey);
    return result;
}

@end
