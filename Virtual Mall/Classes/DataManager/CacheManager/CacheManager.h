//
//  CacheManager.h
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 17/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Utility.h"

@interface CacheManager : NSObject

-(void) imageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *))callBackToMainVC;

@end
