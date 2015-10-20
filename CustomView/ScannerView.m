//
//  ScannerView.m
//  CustomView
//
//  Created by Sam Lau on 9/22/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "ScannerView.h"
#import "MTBBarcodeScanner.h"
#import "ScanAreaView.h"
#import "ScannerGraphics.h"
#import "View+MASAdditions.h"
#import "ColorMacro.h"

@interface ScannerView ()

/*
 @brief 扫描器
 */
@property (strong, nonatomic) MTBBarcodeScanner *scanner;
/*
 @brief 显示被摄像头捕抓的视频数据
 */
@property (strong, nonatomic) UIView *scannerView;
/*
 @brief 绘制扫描区域的view
 */
@property (strong, nonatomic) ScanAreaView *scanAreaView;
/*
 @brief 提示信息Label
 */
@property (strong, nonatomic) UILabel *hintMessageLabel;
/*
 @brief 问题提示Label
 */
@property (strong, nonatomic) UILabel *problemMessageLabel;
/*
 @brief 问题按钮
 */
@property (strong, nonatomic) UIButton *problemButton;

@end

@implementation ScannerView

#pragma mark - Initializers
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }

    [self addSubviews];
    [self defineLayout];

    _scanner = [[MTBBarcodeScanner alloc] initWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]
                                                          previewView:self.scannerView rectOfInterest:[ScannerGraphics rectOfInterest:frame]];

    return self;
}

- (void)addSubviews
{
    [self addSubview:self.scannerView];
    [self addSubview:self.scanAreaView];

    [self addSubview:self.hintMessageLabel];
    [self addSubview:self.problemMessageLabel];
    [self addSubview:self.problemButton];
}

- (void)defineLayout
{
    [self.hintMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        CGRect scannerRect = [ScannerGraphics scanAreaFrame:self.frame];
        make.top.equalTo(self).with.offset(CGRectGetMaxY(scannerRect) + 15.0f);
    }];

    [self.problemMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hintMessageLabel.mas_bottom).with.offset(50.0f);
        make.centerX.equalTo(self).with.offset(-15);
    }];

    [self.problemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.problemMessageLabel.mas_right);
        make.centerY.equalTo(self.problemMessageLabel);
    }];
}

- (void)updateConstraints
{
    [self defineLayout];
    [super updateConstraints];
}

#pragma mark -  Custom Accessors
- (UIView *)scannerView
{
    if (!_scannerView) {
        _scannerView = [[UIView alloc] initWithFrame:self.bounds];
    }
    return _scannerView;
}

- (ScanAreaView *)scanAreaView
{
    if (!_scanAreaView) {
        _scanAreaView = [[ScanAreaView alloc] initWithFrame:self.bounds];
        _scanAreaView.backgroundColor = [UIColor clearColor];
    }
    return _scanAreaView;
}

- (UILabel *)hintMessageLabel
{
    if (!_hintMessageLabel) {
        _hintMessageLabel = [UILabel new];
        _hintMessageLabel.text = @"请扫描你餐桌的二维码，餐厅将即刻准备你的餐食";
        _hintMessageLabel.font = [UIFont systemFontOfSize:13.0f];
        _hintMessageLabel.textColor = THEME_COLOR;
    }
    return _hintMessageLabel;
}

- (UILabel *)problemMessageLabel
{
    if (!_problemMessageLabel) {
        _problemMessageLabel = [UILabel new];
        _problemMessageLabel.text = @"如有问题请";
        _problemMessageLabel.textColor = LIGHT_TEXT_COLOR;
        _problemMessageLabel.font = [UIFont systemFontOfSize:13.0f];
    }
    return _problemMessageLabel;
}

- (UIButton *)problemButton
{
    if (!_problemButton) {
        _problemButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_problemButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@"点击" attributes:@{
                NSFontAttributeName: [UIFont systemFontOfSize:13.0]
        }] forState:UIControlStateNormal];
    }
    return _problemButton;
}


#pragma mark - Scanning logic
- (void)startScanning
{
    [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
        // 停止扫描
        [self.scanner stopScanning];
        // 获取第一个MachineReadableCode对象并获取字符串
        AVMetadataMachineReadableCodeObject *code = [codes firstObject];
        self.handleResultBlock(code.stringValue);
    }];
}

- (void)stopScanning
{
    [self.scanner stopScanning];
}



@end
