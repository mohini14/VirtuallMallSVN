//
//  Validation.h
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 16/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface Validation : NSObject

@property  (strong,nonatomic) NSString *valid;
@property (strong,nonatomic) NSString *reason;

- (instancetype)initWithDictionary:(NSDictionary*)dict;

@end
