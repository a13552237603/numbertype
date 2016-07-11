//
//  SearchViewCell.h
//  数字键盘
//
//  Created by 贺恒涛 on 16/6/23.
//  Copyright © 2016年 贺恒涛. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Myblock) (NSInteger index);

@interface SearchViewCell : UITableViewCell

- (void)infortdataArr:(NSMutableArray *)arr;
@property (nonatomic,strong) Myblock block;

@end
