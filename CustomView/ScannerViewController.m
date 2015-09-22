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

#pragma mark - Custom Accessors
- (ScannerView *)scannerView
{
    if (!_scannerView) {
        _scannerView = [[ScannerView alloc] initWithFrame:self.view.bounds];
    }
    return _scannerView;
}


@end
