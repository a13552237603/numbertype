//
//  ShareViewController.m
//  数字键盘
//
//  Created by 贺恒涛 on 16/3/3.
//  Copyright © 2016年 贺恒涛. All rights reserved.
//

#import "ShareViewController.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params1 = [NSMutableDictionary dictionary];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    NSDictionary *params1 = @{@"caa5e1e073ab943646911057fbd95b9d": @"uuid"};
    [params1 setObject:@"caa5e1e073ab943646911057fbd95b9d" forKey:@"uuid"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params1 options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
   // NSString *jsonStr = [self getJsonStrWithJsonDic:params1];
    [params setObject:jsonStr forKey:@"uuid"];

    
    [manager POST:@"http://test.starbuyer.com/service2/appkey" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (NSString *)getJsonStrWithJsonDic:(NSDictionary *)jsonDic
{
    if (jsonDic == nil) {
        NSLog(@"传入的jsonDic为空");
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
