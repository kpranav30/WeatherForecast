//
//  WeatherReport.m
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import "WeatherReport.h"
#import "WeatherRecord.h"

@implementation WeatherReport

-(instancetype)initReportWithDictionary:(NSDictionary *)receivedData
{
    self = [super init];
    if (self) {
        if (receivedData!=nil) {
            NSString *cityName = [[receivedData objectForKey:@"city"] objectForKey:@"name"];
            if (cityName) {
                self.cityName = [[NSString alloc] initWithString:cityName];
            }
            
            self.day1Report = [[NSMutableArray alloc] init];
            self.day2Report = [[NSMutableArray alloc] init];
            self.day3Report = [[NSMutableArray alloc] init];
            self.day4Report = [[NSMutableArray alloc] init];
            self.day5Report = [[NSMutableArray alloc] init];
            
            [self setDayRecordsWith:receivedData];
        }
    }
    return self;
}

-(void)setDayRecordsWith:(NSDictionary *)receivedData
{
    NSArray *listOfRecords = [receivedData objectForKey:@"list"];
    if (listOfRecords.count) {
        for (NSDictionary *listRecord in listOfRecords) {
            NSArray *dateArray = [[listRecord objectForKey:@"dt_txt"] componentsSeparatedByString:@" "];
            NSString *date = [dateArray objectAtIndex:0];
            NSString *time = [dateArray objectAtIndex:1];
            
            WeatherRecord *aRecord = [[WeatherRecord alloc] init];
            aRecord.date = date;
            aRecord.time = time;
            aRecord.cloudiness = [[NSString alloc] initWithFormat:@"%@%% cloudiness",[[listRecord objectForKey:@"clouds"] objectForKey:@"all"]];
            aRecord.humidity = [[NSString alloc] initWithFormat:@"%@%% humidity",[[listRecord objectForKey:@"main"] objectForKey:@"humidity"]];
            aRecord.weatherDesc = [[NSString alloc] initWithFormat:@"%@ weather",[[[listRecord objectForKey:@"weather"] objectAtIndex:0] objectForKey:@"description"]];
            aRecord.temp = [[NSString alloc] initWithFormat:@"%@ ºC",[[listRecord objectForKey:@"main"] objectForKey:@"temp"]];
            
            if (self.day1Report.count == 0) {
                [self.day1Report addObject:aRecord];
            }else{
                if ([[((WeatherRecord *)[self.day1Report objectAtIndex:0]) date] isEqualToString:date]) {
                    [self.day1Report addObject:aRecord];
                }else{
                    if (self.day2Report.count == 0) {
                        [self.day2Report addObject:aRecord];
                    }else{
                        if ([[((WeatherRecord *)[self.day2Report objectAtIndex:0]) date] isEqualToString:date]) {
                            [self.day2Report addObject:aRecord];
                        }else{
                            if (self.day3Report.count == 0) {
                                [self.day3Report addObject:aRecord];
                            }else{
                                if ([[((WeatherRecord *)[self.day3Report objectAtIndex:0]) date] isEqualToString:date])
                                {
                                    [self.day3Report addObject:aRecord];
                                }else{
                                    if (self.day4Report.count == 0) {
                                        [self.day4Report addObject:aRecord];
                                    }else{
                                        if ([[((WeatherRecord *)[self.day4Report objectAtIndex:0]) date] isEqualToString:date]) {
                                            [self.day4Report addObject:aRecord];
                                        }else{
                                            if (self.day5Report.count == 0) {
                                                [self.day5Report addObject:aRecord];
                                            }else{
                                                if ([[((WeatherRecord *)[self.day5Report objectAtIndex:0]) date] isEqualToString:date]) {
                                                    [self.day5Report addObject:aRecord];
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

@end
