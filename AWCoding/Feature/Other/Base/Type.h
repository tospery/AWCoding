//
//  Type.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#ifndef Type_h
#define Type_h

typedef NS_ENUM(NSInteger, ApiTag){
    ApiTagNone,
    ApiTagUserInfo,
    ApiTagFavoriteDel,
    ApiTagFavoriteMedicine,
    ApiTagFavoriteArticle,
    ApiTagTotal
};

typedef NS_ENUM(NSInteger, SexType){
    SexTypeNone,
    SexTypeMale = SexTypeNone,
    SexTypeFemale
};

#endif /* Type_h */
