//
//  WebServiceManager.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 23/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "WebServiceManager.h"

#define kContentType @"Content-Type"
#define kPostMethod @"POST"
#define kJsonContentType @"application/json"

@implementation WebServiceManager


+(NSMutableURLRequest* ) postRequest : (NSString* ) urlString
{
	return [WebServiceManager request:urlString withRequestType:kPostMethod withContentType:kJsonContentType];
}

// method makes request before sending it to server
+(NSMutableURLRequest* ) request :(NSString* )urlString withRequestType:(NSString*)requestType withContentType :(NSString* )contentType
{
	NSURL* url=[NSURL URLWithString:urlString];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:requestType];
	[request setValue:contentType forHTTPHeaderField:kContentType];
	return request;
}

+(void) sendRequest :(NSURLRequest* )request withCompletionhandler :(void (^) (NSDictionary* dict,NSString* error))callBackToParser
{
	NSURLSession* session = [NSURLSession sharedSession];
	__block NSDictionary* dict;
	NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if(error!=nil)
		{
			dict= [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
		}
		callBackToParser(dict,error.description);
	}];
	[dataTask resume];
}
@end


