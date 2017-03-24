//
//  RegisterShopVC.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 20/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "RegisterShopVC.h"

@interface RegisterShopVC ()

@end

@implementation RegisterShopVC

#pragma mark - Initial VC SetUp
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUpDatePickerView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUpDatePickerView
{
	self.startTimePicker.datePickerMode = UIDatePickerModeTime;
	self.finishTimePicker.datePickerMode=UIDatePickerModeTime;
}
@end
