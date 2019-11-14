//
//  StatusSourceModel.h
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/11.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusSourceUserModel.h"
#import "StatusSourcePhotoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface StatusSourceModel : NSObject
@property (nonatomic , copy) NSString *created_at;
@property (nonatomic , copy) NSString *text;
@property (nonatomic , copy) NSString *source;
@property (nonatomic , strong) StatusSourceUserModel *user;
@property (nonatomic , strong) NSArray *pic_urls;

@end

NS_ASSUME_NONNULL_END
