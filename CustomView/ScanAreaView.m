//
//  ScanAreaView.m
//  CustomView
//
//  Created by Sam Lau on 9/24/15.
//  Copyright © 2015 Sam Lau. All rights reserved.
//

#import "ScanAreaView.h"
#import "ScannerGraphics.h"

@implementation ScanAreaView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [ScannerGraphics drawScannerRectangleWithFrame:rect];
}

@end
