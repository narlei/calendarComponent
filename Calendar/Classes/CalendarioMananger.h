//
//  CalendarioMananger.h
//  Calendar
//
//  Created by Narlei Moreira on 04/02/15.
//  Copyright (c) 2015 NarleiMoreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarioMananger : NSObject
+(NSArray *) getArrayFromMonth:(int) pMonth andYear:(int) pYear;
+(NSString *) nameOfMonth:(int) pMonth;
+(int) yearOfDate:(NSDate *)date;
+(int) monthOfDate:(NSDate *)date;
@end
