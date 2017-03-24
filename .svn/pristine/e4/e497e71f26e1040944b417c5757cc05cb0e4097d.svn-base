//
//  NSString+StringOperations.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 14/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "NSString+StringOperations.h"

@implementation NSString (StringOperations)

//method appends a string at the end of given string
+(NSString *) append :(NSString *)str1 withSring :(NSString *)str2
{
	return [NSString stringWithFormat:@"%@%@",str1,str2];
}

//method trims white spaces from the end of the string and also checks if the string is empty
+(NSString *) trim :(NSString *)str
{
	return [str stringByTrimmingCharactersInSet:
			[NSCharacterSet whitespaceCharacterSet]];
}

@end
