//
//  HTTPResponseBase.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPResponseBase.h"

@implementation HTTPResponseBase
- (void)mj_keyValuesDidFinishConvertingToObject {
    self.code = (self.code == 0 ? JXErrorCodeHTTPOK : 0); // 成功
//    switch (lTag) {
//        case ApiTagUserInfo: {
//            _data = @{@"wiseAccountInfoDto": JXNil2Val(_data, @{})};
//        }
//            break;
//        case ApiTagFavoriteDel: {
//            if ([_msg isEqualToString:@"成功"]) {
//                _data = @(YES);
//            }else {
//                _data = @(NO);
//            }
//        }
//            break;
//        default:
//            break;
//    }
//
//    if (401 == _code) {
//        _code = JXErrorCodeLoginExpired;
//    }
}

@end
