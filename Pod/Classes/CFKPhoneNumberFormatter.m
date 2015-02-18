//
//  CFKPhoneNumberFormatter.m
//  Pods
//
//  Created by Ilter Cengiz on 18/02/15.
//
//

#import "CFKPhoneNumberFormatter.h"

#import "NBPhoneNumberUtil.h"
#import "NBPhoneNumber.h"

@interface CFKPhoneNumberFormatter ()

/**
 This is the utility that formats the numbers.
 */
@property (nonatomic) NBPhoneNumberUtil *util;

/**
 This property contains the current locale country code of the device.
 */
@property (nonatomic) NSString *region;

@end

@implementation CFKPhoneNumberFormatter

#pragma mark - Singleton

+ (CFKPhoneNumberFormatter *)sharedInstance {
    static CFKPhoneNumberFormatter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CFKPhoneNumberFormatter new];
        sharedInstance.util = [NBPhoneNumberUtil new];
        
        sharedInstance.region = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
    });
    return sharedInstance;
}

#pragma mark - Public methods

+ (NBAsYouTypeFormatter *)asYouTypeFormatter {
    return [[NBAsYouTypeFormatter alloc] initWithRegionCode:[self sharedInstance].region];
}

+ (NSString *)examplePhoneNumber {
    
    NBPhoneNumberUtil *util = [self sharedInstance].util;
    NSString *region = [self sharedInstance].region;
    
    NBPhoneNumber *phoneNumber = [util getExampleNumber:region error:nil];
    
    return [util format:phoneNumber numberFormat:NBEPhoneNumberFormatINTERNATIONAL error:nil];
    
}

+ (BOOL)isValidPhoneNumber:(NSString *)phoneNumberString {
    
    NBPhoneNumberUtil *util = [self sharedInstance].util;
    NSString *region = [self sharedInstance].region;
    
    NSError *error = nil;
    
    NBPhoneNumber *phoneNumber = [util parse:phoneNumberString defaultRegion:region error:&error];
    
    if (error) {
        return NO;
    } else {
        return [util isValidNumber:phoneNumber];
    }
    
}

+ (NSString *)formattedNumberInInternationalFormatFromNumber:(NSString *)number {
    return [[self sharedInstance] formattedNumberInFormat:NBEPhoneNumberFormatINTERNATIONAL fromNumber:number];
}

+ (NSString *)formattedNumberInE164FormatFromNumber:(NSString *)number {
    return [[self sharedInstance] formattedNumberInFormat:NBEPhoneNumberFormatE164 fromNumber:number];
}

#pragma mark - Private methods

- (NSString *)formattedNumberInFormat:(NBEPhoneNumberFormat)format fromNumber:(NSString *)number {
    
    NSError *error = nil;
    
    NBPhoneNumber *phoneNumber = [self.util parse:number defaultRegion:self.region error:&error];
    
    if (error) {
        // NSLog(@"Error: %@", error.description);
    } else {
        if ([self.util isValidNumber:phoneNumber]) {
            return [self.util format:phoneNumber numberFormat:format error:&error];
        } else {
            // NSLog(@"Phone number: %@", phoneNumber.description);
        }
    }
    
    return nil;
    
}

@end
