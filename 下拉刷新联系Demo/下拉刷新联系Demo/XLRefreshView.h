//
//  refreshView.h
//  下拉刷新联系Demo
//
//  Created by Mac020 on 16/1/14.
//  Copyright © 2016年 XL10014. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callbackBlock)(void);

@interface XLRefreshView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (nonatomic, copy) callbackBlock callbackBlock;
@property (weak, nonatomic) IBOutlet UIImageView *ImgArrow;
/* 创建刷新控件实例 */
+(XLRefreshView *)defaultRefreshView;

-(void)scrollViewContentOffset:(UIScrollView *)scrollView tableViewTopViewBlock:(callbackBlock)tableViewTopViewBlock;

@end
