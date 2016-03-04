//
//  PostClass.m
//  Hopplers
//
//  Created by TH-MAC02 on 04/11/2015.
//  Copyright © 2015 Tapdash Heuristics. All rights reserved.
//

#import "PostClass.h"

static PostClass *sharedItem = nil;

@implementation PostClass

- (NSMutableURLRequest*)postDataWithParams:(NSDictionary*)params andURL:(NSString*)urlPost{
    
    NSError *error = nil;
    
    NSData *jsonData2 = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData2 encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData as string:\n%@", jsonString);
    
    NSString *post = [[NSString alloc] initWithFormat:@"RequestHeader=%@", jsonString];
    
    NSLog(@"PostData: %@",post);
    
    NSURL *url=[NSURL URLWithString:urlPost];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    return request;
    
}

#pragma mark - Register

//- (NSMutableURLRequest*)uploadPicture:(NSDictionary*)details withUrl:(NSString*)urlStr{
//    
////    NSString *urlString = @"http://tapdashheuristics.com/projects/attendance/register.php";
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:urlStr]];
//    [request setHTTPMethod:@"POST"];
//    
//    NSMutableData *body = [NSMutableData data];
//    
//    
//    // file
//    NSData *imageData = UIImageJPEGRepresentation([details objectForKey:@"avatar"], 0.0);
//    NSString *boundary = @"---------------------------14737809831466499882746641449";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    // [body appendData:[NSString stringWithFormat:@"Location_ID = %@", locationID]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"avatar\"; filename=\"%@.jpg\r\n", [details objectForKey:@"userid_avatar"]] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //  parameter username
////        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
////        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
////        [body appendData:[[details objectForKey:@"userid_avatar"] dataUsingEncoding:NSUTF8StringEncoding]];
////        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    //    [body appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"location_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"%@",locationID] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //  parameter token
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"userid_avatar"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//  
//    // close form
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    // setting the body of the post to the reqeust
//    
//    [request setHTTPBody:body];
//  
//    
//    return request;
//    
//}
//
//#pragma mark - Add New Trip
//
//- (NSMutableURLRequest*)addNewTrip:(NSDictionary*)details withUrl:(NSString*)urlStr{
//    
//    //    NSString *urlString = @"http://tapdashheuristics.com/projects/attendance/register.php";
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:urlStr]];
//    [request setHTTPMethod:@"POST"];
//    
//    NSMutableData *body = [NSMutableData data];
//    
//    
//    // file
//    NSData *imageData = UIImageJPEGRepresentation([details objectForKey:@"avatar"], 0.0);
//    NSString *boundary = @"---------------------------14737809831466499882746641449";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
////    for (int i = 0 ; i < [details[@"Location image"] count]; i++) {
//  
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    // [body appendData:[NSString stringWithFormat:@"Location_ID = %@", locationID]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"Location image\"; filename=\"%@.jpg\r\n", [details objectForKey:@"User ID"]] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//        
////    }
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"From-To"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
////    for (int i = 0 ; i < [details[@"Location name"] count]; i++) {
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"Location name"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
////    }
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"Request-Type"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"Travel type"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"User ID"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"bookings"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"currency"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[details objectForKey:@"participants"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
////    }
//    //  parameter username
//    //        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    //        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid_avatar\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //        [body appendData:[[details objectForKey:@"userid_avatar"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    //    [body appendData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"location_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"%@",locationID] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    //  parameter token
//    
//    
//    // close form
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    // setting the body of the post to the reqeust
//    
//    [request setHTTPBody:body];
//    
//    
//    return request;
//    
//}




#pragma mark - SingleTon

+ (PostClass *)sharedItems
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
