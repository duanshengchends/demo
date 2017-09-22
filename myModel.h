//
//  model.h
//  demo
//
//  Created by 段昇辰 on 2017/8/24.
//  Copyright © 2017年 www.coolketang.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myModel : NSObject

@property NSDictionary *rating;
@property NSArray *genres;
@property NSString *title;
@property NSString *year;
@property NSDictionary *images;


//@property (strong, nonatomic)NSString *dirStr;
//@property (strong, nonatomic)NSMutableArray *actArray;
//@property (strong, nonatomic)NSString *titleStr;
//@property (strong, nonatomic)NSString *imageUrl;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
