//
//  Validation.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 16/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "Validation.h"


@implementation Validation

- (instancetype)initWithDictionary:(NSDictionary*)dict
{
	self = [super init];
	if(self)
	{
		self.valid=dict[kValidKey];
		self.reason=dict[kReasonKey];
	}
	return  self;
}

@end

