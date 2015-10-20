//
//  ColorMacro.h
//  DianDian
//
//  Created by Sam Lau on 8/3/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#ifndef DianDian_ColorMacro_h
#define DianDian_ColorMacro_h

// UIColor Helper Macro
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

// App Colors
#define THEME_COLOR UIColorFromRGB(0x3E86E4)
#define BACKGROUND_COLOR UIColorFromRGB(0xF0EFF4)
#define BACKGROUND_DARK_COLOR UIColorFromRGB(0xD4D5D7)
#define CELL_BORDER_COLOR UIColorFromRGB(0xE8E7E8)
#define TEXT_COLOR UIColorFromRGB(0x292929)
#define LIGHT_TEXT_COLOR UIColorFromRGB(0x666666)
#define BLOCK_COLOR UIColorFromRGB(0x353331)
#define BUTTON_COLOR UIColorFromRGB(0x44DB5E)
#define BUTTON_DARK_COLOR UIColorFromRGB(0xDA3D2D)

// Order Page Color
#define ORDER_STATUS_TEXT_COLOR UIColorFromRGB(0x999999)
#define ORDER_HIGHLIGHT_TEXT_COLOR UIColorFromRGB(0xFF6000)

#define TABLE_VIEW_SEPERATE_COLOR UIColorFromRGB(0xDDDDDD)

#endif
