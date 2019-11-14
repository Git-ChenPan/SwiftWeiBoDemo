//
//  StatusModel.m
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/11.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

#import "StatusModel.h"
#import <MJExtension/MJExtension.h>


@implementation StatusModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"statuses" : @"StatusSourceModel"};
}
@end
