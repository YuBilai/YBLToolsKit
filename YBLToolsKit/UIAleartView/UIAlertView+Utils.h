//
//  UIAlertView+Utils.h
//  PrivateDoctor
//
//  Created by sqc on 15/7/6.
//  Copyright (c) 2015年 mingyou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CompleteBlock) (NSInteger buttonIndex);

@interface UIAlertView (Utils)
- (void)showAlertViewWithCompleteBlock:(CompleteBlock) block;
@end
