//
//  WebServiceManager.h
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 23/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceManager : NSObject

+(NSURLRequest* ) makeRequest : (NSString* )urlString;

+(void) sendRequest :(NSURLRequest* )request withCompletionhandler :(void (^) (NSDictionary* dict,NSString* error))callBackToParser;

+(NSMutableURLRequest* ) postRequest : (NSString* ) urlString;

@end
