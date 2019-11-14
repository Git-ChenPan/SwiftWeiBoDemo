//
//  StatusSourceModel.m
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/11.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

#import "StatusSourceModel.h"

@implementation StatusSourceModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"pic_urls" : @"StatusSourcePhotoModel"};
}
- (NSString *)text {
    NSString *replaceString;
    if ([_text containsString:@"\n"]) {
       replaceString = [_text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }else{
       replaceString = _text;
    }
    return replaceString;
}
@end
