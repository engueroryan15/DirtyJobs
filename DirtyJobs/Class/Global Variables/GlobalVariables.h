//
//  GlobalVariables.h
//  RadioApp
//
//  Created by Nico Villanueva iOS Dev on 20/5/15.
//  Copyright (c) 2015 engueroryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVariables : NSObject

//User Variables;

@property (strong, nonatomic) NSString *userNameStr;

@property (strong, nonatomic) NSString *emailStr;

@property (strong, nonatomic) NSString *passwordStr;

// User Details


@property (strong, nonatomic) NSString *nameStr;

@property (strong, nonatomic) NSString *genderStr;

@property (strong, nonatomic) NSString *statusStr;

@property (strong, nonatomic) NSString *ageStr;

@property (strong, nonatomic) NSString *birthdayStr;

@property (strong, nonatomic) NSString *addressStr;

@property (strong, nonatomic) NSString *contactStr;


// Service Details

@property (strong, nonatomic) NSString *budgetStr;

@property (strong, nonatomic) NSString *typeOfServiceStr;

@property (strong, nonatomic) NSString *typeOfPaymentStr;


+ (GlobalVariables *)sharedItems;




@end
