//
//  GlobalVariables.m
//  RadioApp
//
//  Created by Nico Villanueva iOS Dev on 20/5/15.
//  Copyright (c) 2015 engueroryan. All rights reserved.
//

#import "GlobalVariables.h"


static GlobalVariables *sharedItem = nil;

@implementation GlobalVariables

+ (GlobalVariables *)sharedItems
{
    if (sharedItem == nil) {
        sharedItem = [[super allocWithZone:NULL]init];
    }
    return  sharedItem;
}
- (id)init{
    
    if ((self = [super init])) {
        
    }
    
    return self;
}
+ (id)allocWithZone:(NSZone *)zone{
    
    return  [self sharedItems];
    
}
- (id)copyWithZone:(NSZone *)zone{
    return self;
}



@end
