//
//  Json.m
//  RadioApp
//
//  Created by Nico and Shang Forever on 5/23/14.
//  Copyright (c) 2014 engueroryan. All rights reserved.
//

#import "Json.h"
@implementation Json

+(id)jsonParser:(NSData*)data{
    
    NSError* error = nil;
    Json* json = [NSJSONSerialization
                  JSONObjectWithData:data
                  options:kNilOptions
                  error:&error];
    
    if (error != nil) {
        NSLog(@"Error %@", [error localizedDescription]);
    } else {
        return json;
    }
    
    return json;
}
@end
