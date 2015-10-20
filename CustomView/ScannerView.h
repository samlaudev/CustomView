//
//  ScannerView.h
//  CustomView
//
//  Created by Sam Lau on 9/22/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScannerView : UIView

#pragma mark - UI properties
/*
 @brief 问题按钮
 */
@property (strong, nonatomic, readonly) UIButton *problemButton;

#pragma mark - Properties;
@property (copy, nonatomic) void (^handleResultBlock)(NSString *result);

#pragma mark - Methods
- (void)startScanning;
- (void)stopScanning;

@end
