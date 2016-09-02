//
//  OCTool.m
//  Swift_OC_bridge
//
//  Created by 李帅 on 16/9/2.
//  Copyright © 2016年 ChuangHu. All rights reserved.
//

#import "OCTool.h"
#import "Swift_OC_bridge-Swift.h"
@implementation OCTool
+ (NSString *)startAskingQuestionWithTag:(int)tag{
    switch (tag) {
        case 0:
            return @"今天晚上喝什么？";
            break;
        case 1:
            return @"今天晚上吃什么？";
            break;
            
        default:
            return @"今天晚上做什么？";
            break;
    }
}

- (void)testFunction{
    ViewController *vc = [[ViewController alloc]init];
    [vc startAsking:@"2333"];
}
@end
