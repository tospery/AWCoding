//
//  User.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXUser.h"
#import "Skill.h"

@interface User : JXUser
@property (nonatomic, assign) BOOL is_member;               // 0
@property (nonatomic, assign) BOOL followed;                // false
@property (nonatomic, assign) BOOL follow;                  // false
@property (nonatomic, assign) BOOL is_phone_validated;      // true
@property (nonatomic, assign) BOOL email_validation;        // 1
@property (nonatomic, assign) BOOL phone_validation;        // 1
@property (nonatomic, assign) BOOL twofa_enabled;           // 0

@property (nonatomic, assign) NSInteger job;                // 1
@property (nonatomic, assign) SexType sex;                  // 0
@property (nonatomic, assign) NSInteger created_at;         // 1445102709000
@property (nonatomic, assign) NSInteger last_logined_at;    // 1519785308510
@property (nonatomic, assign) NSInteger last_activity_at;   // 1519784733965
@property (nonatomic, assign) NSInteger updated_at;         // 1519784727000
@property (nonatomic, assign) NSInteger status;             // 1
@property (nonatomic, assign) NSInteger vip;                // 3
@property (nonatomic, assign) NSInteger vip_expired_at;     // 1529596800000
@property (nonatomic, assign) NSInteger degree;             // 3
@property (nonatomic, assign) NSInteger follows_count;      // 1
@property (nonatomic, assign) NSInteger fans_count;         // 0
@property (nonatomic, assign) NSInteger tweets_count;       // 0

@property (nonatomic, assign) CGFloat points_left;          // 0.41

@property (nonatomic, copy) NSString *tags_str;             // iOS, 专注前端一百年
@property (nonatomic, copy) NSString *tags;                 // 13,27
@property (nonatomic, copy) NSString *job_str;              // 开发
@property (nonatomic, copy) NSString *phone;                // 18981747155
@property (nonatomic, copy) NSString *birthday;             // 1984-06-23
@property (nonatomic, copy) NSString *location;             // 四川 成都
@property (nonatomic, copy) NSString *company;              // 四川艾维科思科技有限公司
@property (nonatomic, copy) NSString *slogan;               // 理解能力+技术能力+合约精神=优秀的自由职业者
@property (nonatomic, copy) NSString *website;              //
@property (nonatomic, copy) NSString *introduction;         //
@property (nonatomic, copy) NSString *avatar;               // /static/fruit_avatar/Fruit-1.png
@property (nonatomic, copy) NSString *gravatar;             // https://dn-coding-net-avatar.qbox.me/6312093c-1946-41b9-afd5-4044f4317b19.jpg
@property (nonatomic, copy) NSString *lavatar;              // /static/fruit_avatar/Fruit-1.png
@property (nonatomic, copy) NSString *global_key;           // tospery
@property (nonatomic, copy) NSString *name;                 // tospery
@property (nonatomic, copy) NSString *name_pinyin;          //
@property (nonatomic, copy) NSString *path;                 // /u/tospery
@property (nonatomic, copy) NSString *email;                // tospery@gmail.com
@property (nonatomic, copy) NSString *school;               // 重庆邮电大学
@property (nonatomic, copy) NSString *phone_country_code;   // +86
@property (nonatomic, copy) NSString *country;              // cn

@property (nonatomic, strong) NSArray *skills;

@end








