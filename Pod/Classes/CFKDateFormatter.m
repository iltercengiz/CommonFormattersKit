//
//  CFKDateFormatter.m
//  Pods
//
//  Created by Ilter Cengiz on 18/02/15.
//
//

#import "CFKDateFormatter.h"

@interface CFKDateFormatter ()

/**
 Date formatter object used to parse strings into date objects and vice-versa.
 */
@property (nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation CFKDateFormatter

#pragma mark - Singleton

+ (CFKDateFormatter *)sharedInstance {
    static CFKDateFormatter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CFKDateFormatter new];
        sharedInstance.dateFormatter = [NSDateFormatter new];
    });
    return sharedInstance;
}

#pragma mark - Public methods

+ (NSDate *)dateFromString:(NSString *)string withFormat:(CFKDateFormat)format {
    [[self sharedInstance] setFormat:format];
    return [[self sharedInstance].dateFormatter dateFromString:string];
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(CFKDateFormat)format {
    [[self sharedInstance] setFormat:format];
    return [[self sharedInstance].dateFormatter stringFromDate:date];
}

+ (void)setLocale:(NSLocale *)locale {
    if (locale) {
        [self sharedInstance].dateFormatter.locale = locale;
    }
}

+ (void)setTimeZone:(NSTimeZone *)timeZone {
    if (timeZone) {
        [self sharedInstance].dateFormatter.timeZone = timeZone;
    }
}

#pragma mark - Private methods

- (void)setFormat:(CFKDateFormat)format {
    
    switch (format) {
            
        case CFKDateFormatyyyy: self.dateFormatter.dateFormat = @"yyyy"; break;
        case CFKDateFormatyyyyMMdd: self.dateFormatter.dateFormat = @"yyyy-MM-dd"; break;
        case CFKDateFormatyyyyMMddHHmm: self.dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm"; break;
        case CFKDateFormatyyyyMMddHHmmss: self.dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss"; break;
            
        case CFKDateFormatMMMM: self.dateFormatter.dateFormat = @"MMMM"; break;
        case CFKDateFormatMMMMyyyy: self.dateFormatter.dateFormat = @"MMMM / yyyy"; break;
            
        case CFKDateFormatd: self.dateFormatter.dateFormat = @"d"; break;
        case CFKDateFormatddMM: self.dateFormatter.dateFormat = @"dd.MM"; break;
        case CFKDateFormatdEEEEE: self.dateFormatter.dateFormat = @"dEEEEE"; break;
            
        case CFKDateFormatEEEE: self.dateFormatter.dateFormat = @"EEEE"; break;
        case CFKDateFormatEdd: self.dateFormatter.dateFormat = @"E dd"; break;
        case CFKDateFormatEEEEddMMM: self.dateFormatter.dateFormat = @"EEEE dd MMM"; break;
            
        case CFKDateFormatHHmm: self.dateFormatter.dateFormat = @"HH:mm"; break;
            
        default: self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            
    }
    
}

@end
