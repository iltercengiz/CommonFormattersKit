//
//  CFKDateFormatterTests.m
//  CommonFormattersKit
//
//  Created by Ilter Cengiz on 19/02/15.
//  Copyright (c) 2015 Ilter Cengiz. All rights reserved.
//

#import "CFKDateFormatter.h"

SpecBegin(CFKDateFormatter)

describe(@"Strings from dates", ^{
    
    __block NSDate *date;
    
    beforeAll(^{
        // Date: Wed, 18 Feb 2015 20:35:45 GMT
        date = [NSDate dateWithTimeIntervalSince1970:1424291745];
        
        // Set time zone
        [CFKDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    });
    
    it(@"should give 2015", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatyyyy]).to.equal(@"2015");
    });
    
    it(@"should give 2015-02-18", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatyyyyMMdd]).to.equal(@"2015-02-18");
    });
    
    it(@"should give 2015-02-18 20:35", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatyyyyMMddHHmm]).to.equal(@"2015-02-18 20:35");
    });
    
    it(@"should give 2015-02-18 20:35:45", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatyyyyMMddHHmmss]).to.equal(@"2015-02-18 20:35:45");
    });
    
    it(@"should give February", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatMMMM]).to.equal(@"February");
    });
    
    it(@"should give February / 2015", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatMMMMyyyy]).to.equal(@"February / 2015");
    });
    
    it(@"should give 18", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatd]).to.equal(@"18");
    });
    
    it(@"should give 18.02", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatddMM]).to.equal(@"18.02");
    });
    
    it(@"should give 18W", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatdEEEEE]).to.equal(@"18W");
    });
    
    it(@"should give Wednesday", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatEEEE]).to.equal(@"Wednesday");
    });
    
    it(@"should give Wed 18", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatEdd]).to.equal(@"Wed 18");
    });
    
    it(@"should give Wednesday 18 Feb", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatEEEEddMMM]).to.equal(@"Wednesday 18 Feb");
    });
    
    it(@"should give 20:35", ^{
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatHHmm]).to.equal(@"20:35");
    });
    
});

describe(@"Locale", ^{
    
    __block NSDate *date;
    
    beforeAll(^{
        // Date: Wed, 18 Feb 2015 20:35:45 GMT
        date = [NSDate dateWithTimeIntervalSince1970:1424291745];
        
        // Set time zone
        [CFKDateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    });
    
    it(@"should give Wednesday 18 Feb", ^{
        [CFKDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"US"]];
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatEEEEddMMM]).to.equal(@"Wednesday 18 Feb");
    });
    
    it(@"should give Çarşamba 18 Şub", ^{
        [CFKDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"TR"]];
        expect([CFKDateFormatter stringFromDate:date withFormat:CFKDateFormatEEEEddMMM]).to.equal(@"Çarşamba 18 Şub");
    });
    
});

SpecEnd
