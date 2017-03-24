//
//  UserMyAccountVC.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 16/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "SWRevealViewController.h"
#import "Utility.h"
#import "UserMyAccountVC.h"

@interface UserMyAccountVC ()

@end

@implementation UserMyAccountVC

#pragma mark - life cycle method
- (void)viewDidLoad
{
    [super viewDidLoad];
    [Utility setSliderBarButtonProperty:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
