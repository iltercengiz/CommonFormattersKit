//
//  CFKDateFormatter.h
//  Pods
//
//  Created by Ilter Cengiz on 18/02/15.
//
//

#import <Foundation/Foundation.h>

/**
 Available date formats.
 These can be used to parse both strings to dates and dates to strings.
 Every enum has an example with a comment line, given the date to be Wednesday, 18 February, 2015, 20:15:30.
 */
typedef NS_ENUM(NSInteger, CFKDateFormat) {
    
    // Defaults to `NSDateFormatterMediumStyle`
    // Also any non-valid format (such as Integer value of 256) will be considered as default.
    CFKDateFormatDefault = 0,
    
    // 2015
    CFKDateFormatyyyy = 1,
    
    // 2015-02-18
    CFKDateFormatyyyyMMdd,
    
    // 2015-02-18 20:15
    CFKDateFormatyyyyMMddHHmm,
    
    // 2015-02-18 20:15:30
    CFKDateFormatyyyyMMddHHmmss,
    
    // February
    CFKDateFormatMMMM,
    
    // February / 2015
    CFKDateFormatMMMMyyyy,
    
    // 18
    CFKDateFormatd,
    
    // 18.02
    CFKDateFormatddMM,
    
    // 18W
    CFKDateFormatdEEEEE,
    
    // Wednesday
    CFKDateFormatEEEE,
    
    // Wed 18
    CFKDateFormatEdd,
    
    // Wednesday 18 Feb
    CFKDateFormatEEEEddMMM,
    
    // 20:15
    CFKDateFormatHHmm,
    
};

@interface CFKDateFormatter : NSObject

/**
 Returns an `NSDate` object parsed from the given string and format.
 
 @param string The string to be parsed
 @param format Date format to be used in parsing the string
 
 @return Date object parsed from the string in the given format
 */
+ (NSDate *)dateFromString:(NSString *)string withFormat:(CFKDateFormat)format;

/**
 Returns an `NSString` object parsed from the given date and format.
 
 @param date The date to be parsed
 @param format Date format to be used in parsing the date
 
 @return String object parsed from the date in the given format
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(CFKDateFormat)format;

/**
 Sets the locale for date formatter.
 By default it uses the systems locale set in device settings.
 
 @param Locale for the date formatter
 */
+ (void)setLocale:(NSLocale *)locale;

/**
 Sets the time zone for date formatter.
 By default it uses the time zone from the date & time settings of the device.
 
 @param Time zone for the date formatter
 */
+ (void)setTimeZone:(NSTimeZone *)timeZone;

@end
