//
//  JXDialog+AWCoding.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXDialog+AWCoding.h"

@implementation JXDialog (AWCoding)
+ (void)load{
    JXExchangeMethod(@selector(showHUD:), @selector(my_showHUD:));
    JXExchangeMethod(@selector(showPopup:), @selector(my_showPopup:));
    JXExchangeMethod(@selector(hideHUD), @selector(my_hideHUD));
}

- (void)my_showHUD:(NSString *)title {
    JXHUDProcessing(title);
}

- (void)my_showPopup:(NSString *)message {
    if (0 == message.length) {
        return;
    }
    
    JXHUDInfo(message, YES);
}

- (void)my_showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                   handler:(JXVoidBlock_int)handler {
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:title andMessage:message];
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    if (0 != cancelButtonTitle.length) {
        [alertView addButtonWithTitle:cancelButtonTitle type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
            if (handler) {
                handler(JXAlertButtonStyleCancel);
            }
        }];
    }
    if (0 != destructiveButtonTitle.length) {
        [alertView addButtonWithTitle:destructiveButtonTitle type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {
            if (handler) {
                handler(JXAlertButtonStyleDestructive);
            }
        }];
    }
    for (NSString *title in otherButtonTitles) {
        [alertView addButtonWithTitle:title type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
            if (handler) {
                handler(JXAlertButtonStyleDefault);
            }
        }];
    }
    [alertView show];
}

- (void)my_hideHUD {
    JXHUDHide();
}

@end
