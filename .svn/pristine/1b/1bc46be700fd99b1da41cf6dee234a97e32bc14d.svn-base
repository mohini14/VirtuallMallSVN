//
//  RegistrationViewController.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 14/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "RegistrationViewController.h"

#define kStatusArrayCapacity 5
#define kCheckBoxSelectedImage @"CheckBoxSelect.png"
#define kCheckBoxUnselectedImage @"CheckBoxUnselect.jpg"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController
{
	BOOL isChecked;
}

#pragma mark - Initial VC setup.
- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setUpVC];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated
{
	isChecked=NO;
	[super viewWillAppear:animated];
}

-(void) setUpVC
{
	isChecked=NO;
}



#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[textField resignFirstResponder];
}



#pragma mark - Actions on Registration VC

//method handles the actions on tap gesture
- (IBAction) dismissKeyboard
{
		[self.view endEditing:YES];
}

//method handles the action on checkbox
- (IBAction)sellerCheckBoxPressed:(id)sender
{
	if(!isChecked)
	{
		[self.sellerCheckBox setImage:[UIImage imageNamed:kCheckBoxSelectedImage] forState:UIControlStateNormal];
		isChecked=YES;
	}
	else
	{
		[self.sellerCheckBox setImage:[UIImage imageNamed:kCheckBoxUnselectedImage] forState:UIControlStateNormal];
		isChecked=NO;
	}
}

//method passes control to Login VC
- (IBAction)haveAccountButtonPressed:(UIButton *)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

//method handles actions on Sign Up button
- (IBAction)signUpButtonPressed:(id)sender
{
	if([self validateFirstName] && [self validateLasttName] && [self validateEmail] && [self validateContact]  && [self validatePassword])
	{
		//to be done : here method of parser will be called to post data to server
		[Utility promptErrorMessage:NSLocalizedString(@"SignUp Succesfully", nil) sender:self];
		[self clearTextFields];
	}
	
}

// method clears the content of all text fields once signUp is succesful
-(void) clearTextFields
{
	self.firstName.text=kEmptyFieldNotation;
	self.lastName.text=kEmptyFieldNotation;
	self.email.text=kEmptyFieldNotation;
	self.contact.text=kEmptyFieldNotation;
	self.password.text=kEmptyFieldNotation;
	self.confirmPassword.text=kEmptyFieldNotation;
}


#pragma mark - Validation Methods for each Field

-(BOOL) validateFirstName
{
	Validation *validation=[Validator validateName:self.firstName.text];
	if([validation.valid isEqualToString:kValidKeyNoValue])
	{
		NSString *str=[NSString append:NSLocalizedString(@"'First Name' ", nil) withSring:validation.reason];
		[Utility promptErrorMessage:str sender:self];
		return false;
	}
	return true;
	
}

-(BOOL) validateLasttName
{
	Validation *validation=[Validator validateName:self.lastName.text];
	if([validation.valid isEqualToString:kValidKeyNoValue])
	{
		NSString *str=[NSString append:NSLocalizedString(@"'Last Name' ", nil) withSring:validation.reason];
		[Utility promptErrorMessage:str sender:self];
		return false;
	}
	return true;
	
}

-(BOOL) validateContact
{
	Validation *validation=[Validator validateContact:self.contact.text];
	if([validation.valid isEqualToString:kValidKeyNoValue])
	{
		NSString *str=[NSString append:NSLocalizedString(@"'Contact' ", nil) withSring:validation.reason];
		[Utility promptErrorMessage:str sender:self];
		return false;
	}
	return true;
	
}

-(BOOL) validateEmail
{
	Validation *validation=[Validator validateEmail:self.email.text];
	if([validation.valid isEqualToString:kValidKeyNoValue])
	{
		NSString *str=[NSString append:NSLocalizedString(@"'Email' ", nil) withSring:validation.reason];
		[Utility promptErrorMessage:str sender:self];
		return false;
	}
	return true;
	
}

-(BOOL) validatePassword
{
	Validation *validation=[Validator validatePassword:self.password.text withConfirmPassword:self.confirmPassword.text];
	if([validation.valid isEqualToString:kValidKeyNoValue])
	{
		NSString *str=[NSString append:NSLocalizedString(@"'Password' ", nil) withSring:validation.reason];
		[Utility promptErrorMessage:str sender:self];
		return false;
	}
	return true;
	
}


@end
