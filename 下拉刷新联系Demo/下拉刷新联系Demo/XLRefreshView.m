//
//  refreshView.m
//  下拉刷新联系Demo
//
//  Created by Mac020 on 16/1/14.
//  Copyright © 2016年 XL10014. All rights reserved.
//

#import "XLRefreshView.h"

@interface XLRefreshView(){
    BOOL isCanRefresh;
    CGFloat maxContentOffSet;
}
@end

@implementation XLRefreshView

-(void)awakeFromNib{
    maxContentOffSet = 0;
}

+(XLRefreshView *)defaultRefreshView{
    XLRefreshView *  refView  =  [[[NSBundle mainBundle] loadNibNamed:@"XLRefreshView" owner:nil options:nil] lastObject];
    refView.frame = CGRectMake(0, -50, [UIScreen mainScreen].bounds.size.width, 50);
    return refView;
}

-(void)scrollViewContentOffset:(UIScrollView *)scrollView tableViewTopViewBlock:(callbackBlock)tableViewTopViewBlock{
    self.callbackBlock = tableViewTopViewBlock;

    if (scrollView.contentOffset.y > maxContentOffSet && maxContentOffSet <= -50) {
        if (isCanRefresh) {
            isCanRefresh = NO;
            if (self.callbackBlock) {
                self.callbackBlock();
            }
        }
    }else if (scrollView.contentOffset.y > -30) {
        self.ImgArrow.image = [UIImage imageNamed:@"arrow_list_common_down"];
        self.lblDesc.text = @"继续下拉即可刷新";

    }else if (scrollView.contentOffset.y <= -50){
        isCanRefresh = YES;
        self.lblDesc.text = @"松手即可刷新";
        self.ImgArrow.image = [UIImage imageNamed:@"arrow_list_common_up"];
    }
    
    maxContentOffSet = scrollView.contentOffset.y;
    
}
@end
