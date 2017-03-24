//
//  LoginPageViewController.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 09/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "Utility.h"
#import "Validation.h"
#import "Validator.h"
#import "NSString+StringOperations.h"
#import "LoginPageViewController.h"

#define kTempEmail @"a@g.com"
#define kTempPassword @"abc"
#define kLoginToHomeSegueIdentifier @"LoginToHomeVC"

@interface LoginPageViewController () <UITextFieldDelegate>

@end

@implementation LoginPageViewController

#pragma mark - life cycle method
- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction method
//This method will excecute when user preess login button
- (IBAction) loginButtonAction:(id)sender
{
   
    if([self authenticateUserCredential])
        [self performSegueWithIdentifier:kLoginToHomeSegueIdentifier sender:nil];
    else if(![self.emailInputTextField.text isEqualToString:kTempEmail] && ![self.passwordInputTextField.text isEqualToString:kTempPassword])
        [Utility promptErrorMessage:NSLocalizedString(@"Invalid Email and Password", nil) sender:self];
    else if(![self.emailInputTextField.text isEqualToString:kTempEmail])
        [Utility promptErrorMessage:NSLocalizedString(@"Invalid Email", nil) sender:self];
    else if(![self.passwordInputTextField.text isEqualToString:kTempPassword])
        [Utility promptErrorMessage:NSLocalizedString(@"Invalid Password", nil) sender:self];
    [self emptyTextField];
}

//This method will execute when user tap on view. Here it will resign keyboard.
- (IBAction)tapGestureRecognizer:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - private method

//This method will set text field empty
- (void) emptyTextField
{
    self.emailInputTextField.text = kEmptyFieldNotation;
    self.passwordInputTextField.text = kEmptyFieldNotation;
}
//This method checks user credential
- (BOOL) authenticateUserCredential
{
    return ([self validateEmail] && [self isValidEmail] && [self isValidPassword]);
}

- (BOOL) isValidEmail
{
    return [self.emailInputTextField.text isEqualToString:kTempEmail];
}

-(BOOL) isValidPassword
{
    
    return [self.passwordInputTextField.text isEqualToString:kTempPassword];
}

-(BOOL) validateEmail
{
    Validation *validation=[Validator validateEmail:self.emailInputTextField.text];
    if([validation.valid isEqualToString:kValidKeyNoValue])
    {
        NSString *str=[NSString append:NSLocalizedString(@"'Email' ", nil) withSring:validation.reason];
        [Utility promptErrorMessage:str sender:self];
        return false;
    }
    return true;
    
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
@end
