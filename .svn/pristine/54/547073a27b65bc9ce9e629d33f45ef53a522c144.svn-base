//
//  DataParser.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 23/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DataParser.h"

@implementation DataParser

+(void) registrForUser :(NSDictionary*) dict withCompletion:(void (^) (NSDictionary* dict , NSString* errorMsg))callBackToMainVC
{
	NSString* urlString = [Utility composeURLString:dict withResource:kVirtualMallRegistration];
	NSURLRequest* request = [WebServiceManager postRequest:urlString];
	[WebServiceManager sendRequest:request withCompletionhandler:^(NSDictionary *dict, NSString *error) {
	
	
	
		
	}];
}

@end
