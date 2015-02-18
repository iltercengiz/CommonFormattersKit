//
//  CFKPhoneNumberFormatter.h
//  Pods
//
//  Created by Ilter Cengiz on 18/02/15.
//
//

#import <Foundation/Foundation.h>

#import "NBAsYouTypeFormatter.h"

@interface CFKPhoneNumberFormatter : NSObject

/**
 Creates and returns a formatter to be used with text entries.
 The formatter object returned from this method is not a singleton object.
 Every time this method is called a new formatter object with the region code of the current device is created and returned.
 
 @return A formatter object
 */
+ (NBAsYouTypeFormatter *)asYouTypeFormatter;

/**
 Creates and returns an example phone number based on the current device's country code.
 
 @return Example phone number string
 */
+ (NSString *)examplePhoneNumber;

/**
 Checks the validity of a given phone number string.
 
 @return BOOL value indicating the validity of a number
 */
+ (BOOL)isValidPhoneNumber:(NSString *)phoneNumberString;

/**
 Formats the given string as +1 500-123 45 67 and returns it.
 
 @param number Phone number string to be formatted
 
 @return String formatted as +1 500-123 45 67
 */
+ (NSString *)formattedNumberInInternationalFormatFromNumber:(NSString *)number;

/**
 Formats the given string as +15001234567 and returns it.
 
 @param number Phone number string to be formatted
 
 @return String formatted as +15001234567
 */
+ (NSString *)formattedNumberInE164FormatFromNumber:(NSString *)number;

@end
