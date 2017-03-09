//
//  WeatherReport.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherReport : NSObject

@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSMutableArray *day1Report;
@property(nonatomic,strong)NSMutableArray *day2Report;
@property(nonatomic,strong)NSMutableArray *day3Report;
@property(nonatomic,strong)NSMutableArray *day4Report;
@property(nonatomic,strong)NSMutableArray *day5Report;

-(instancetype)initReportWithDictionary:(NSDictionary *)receivedData;

@end
