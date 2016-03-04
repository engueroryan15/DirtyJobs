//
//  PostClass.h
//  Hopplers
//
//  Created by TH-MAC02 on 04/11/2015.
//  Copyright © 2015 Tapdash Heuristics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface PostClass : NSObject

- (NSMutableURLRequest*)postDataWithParams:(NSDictionary*)params andURL:(NSString*)urlPost;

//- (NSMutableURLRequest*)uploadPicture:(NSDictionary*)details withUrl:(NSString*)urlStr;
//
//- (NSMutableURLRequest*)addNewTrip:(NSDictionary*)details withUrl:(NSString*)urlStr;

+ (PostClass *) sharedItems;

@end
