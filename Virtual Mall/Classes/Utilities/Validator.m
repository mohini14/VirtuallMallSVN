//
//  Validator.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 14/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Validator.h"
#import "NSString+StringOperations.h"

#define kEmailRegex  @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define kContactRegex @"[1-9][0-9]{9}"
#define kNameRegex @"[a-zA-Z]+"
#define kNameMinLength @2
#define kNameMaxLength @20
#define kEmailMaxLength @40
#define kContactLength @10
#define kPasswordMinLenth @8
#define kPasswordMaxLength @20
#define kSelfMatchedStringConstant @"SELF MATCHES %@"


@implementation Validator

/* method checks if particular field is Valid or not
 param : string : field to be validated
 min : min length of field
 max : max length of field
 regex:regular expression for the format it should follow
 return : Validation type(model class with two properties)
 Key 1: Validation-Key : YES or NO
 Key 2:Result-Key      :if(Validation Key==NO) reason for invalidation else nil;
 */

+(Validation *) validateString:(NSString *)data withMinLength:(NSNumber *)min withMaxLength:(NSNumber *)max withRegex:(NSString *)regex
{
	// check if data is empty
	if([[NSString trim:data] isEqualToString:kEmptyFieldNotation])
	{
		Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyNoValue,kReasonKey:NSLocalizedString(@": Field is Empty", nil)}];
		return validation;
	}
	
	// checks if data length is lesser than min value
	else if (min != nil && data.length < min.integerValue)
	{
		Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyNoValue,kReasonKey:[NSString append:NSLocalizedString(@"Min length reqired is :", nil) withSring:min.stringValue]}];
		return validation;
	}
	
	//checks if data length is greater than max value
	else if(max != nil && data.length > max.integerValue)
	{
		Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyNoValue,kReasonKey:[NSString append:NSLocalizedString(@"Max length reqired is :", nil) withSring:max.stringValue]}];
		return validation;
	}
	
	//checks if data is in proper format
	else if (regex !=nil)
	{
		NSPredicate *test = [NSPredicate predicateWithFormat:kSelfMatchedStringConstant,regex];
		if (![test evaluateWithObject:data])
		{
			Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyNoValue,kReasonKey:NSLocalizedString(@"Not a proper Format :", nil)}];
			return validation;
		}
	}
	
	Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyYesValue}];
	return validation;
	
}




+(Validation *) validateName :(NSString *)name
{
	return [Validator validateString:name withMinLength:kNameMinLength withMaxLength:kNameMaxLength withRegex:kNameRegex];
}


+(Validation *) validateEmail :(NSString *)email
{
	return [Validator validateString:email withMinLength:nil withMaxLength:kEmailMaxLength withRegex:kEmailRegex];
}


+(Validation *) validateContact :(NSString *)contactNumber
{
	return [Validator validateString:contactNumber withMinLength:kContactLength withMaxLength:kContactLength withRegex:kContactRegex];
}


+(Validation *) validatePassword :(NSString *)password withConfirmPassword :(NSString *)confrimPassword
{
	// calls validation of password Field only if password and confirm password Field matches
	if(![password isEqualToString:confrimPassword])
	{
		Validation *validation=[[Validation alloc]initWithDictionary:@{kValidKey:kValidKeyNoValue,kReasonKey:NSLocalizedString(@" doesnot Match with Confirm password Field", nil)}];
		return validation;
		
	}
	return [Validator validateString:password withMinLength:kPasswordMinLenth withMaxLength:kPasswordMaxLength withRegex:nil];
}
@end
