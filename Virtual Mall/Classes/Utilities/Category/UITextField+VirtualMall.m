//
//  UITextField+VirtualMall.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 15/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "UITextField+VirtualMall.h"

#define kTextFieldBorderWidth 2.0
#define kTextFieldCornerRadius 3.0
#define kTextFieldRedColor 0.667
#define kTextFieldGreenColor 0.667
#define kTextFieldBlueColor 0.667
#define kTextFieldAlpha 1.0


@implementation UITextField (VirtualMall)

// overriding text field drawrect method
-(void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	self.layer.borderWidth = kTextFieldBorderWidth;
	self.layer.borderColor = [UIColor colorWithRed:kTextFieldRedColor green:kTextFieldGreenColor blue:kTextFieldBlueColor alpha:kTextFieldAlpha].CGColor;
	self.layer.cornerRadius =kTextFieldCornerRadius;
	
}

@end
