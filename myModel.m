//
//  model.m
//  demo
//
//  Created by 段昇辰 on 2017/8/24.
//  Copyright © 2017年 www.coolketang.com. All rights reserved.
//

#import "myModel.h"

@implementation model

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [self init];
    if (self) {
        self.rating = dic[@"rating"];
        self.genres = dic[@"genres"];
        self.title = dic[@"title"];
        self.year = dic[@"year"];
        self.images = dic[@"images"];
    }
    return self;
}
@end
