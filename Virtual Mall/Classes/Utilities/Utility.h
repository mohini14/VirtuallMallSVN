//
//  Utility.h
//  Virtual Mall
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSString*) retrievePathForNameInDocumentDirectory:(NSString*) fileName withFileType:(NSString*) type;

+ (void) promptErrorMessage:(NSString*)message sender:(UIViewController*)sender;

+ (void) setSliderBarButtonProperty:(UIViewController*)sender;


+(NSString* ) composeURLString :(NSDictionary *)dict withResource :(NSString *)resource;





@end
