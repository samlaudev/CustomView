//
//  ScannerViewController.m
//  CustomView
//
//  Created by Sam Lau on 9/22/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "ScannerViewController.h"
#import "ScannerView.h"

@interface ScannerViewController ()

@property (strong, nonatomic) ScannerView *scannerView;

@end

@implementation ScannerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 构建view hierarchy
    [self buildViewHierarchy];
}

- (void)buildViewHierarchy
{
    [self.view addSubview:self.scannerView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 开始扫描
    [self.scannerView startScanning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 停止扫描
    [self.scannerView stopScanning];
}


#pragma mark - Custom Accessors
- (ScannerView *)scannerView
{
    if (!_scannerView) {
        _scannerView = [[ScannerView alloc] initWithFrame:self.view.bounds];
        [_scannerView setHandleResultBlock:^(NSString *result) {
            NSLog(@"result = %@", result);
        }];
    }
    return _scannerView;
}


@end
