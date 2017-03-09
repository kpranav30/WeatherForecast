//
//  WeatherForcastFetcher.m
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import "WeatherForcastFetcher.h"
#import "DataAccess.h"
#import "WeatherReport.h"

@interface WeatherForcastFetcher ()<DataAccessDelegate>
{
    DataAccess *dataAccessLayer;
}

@end

@implementation WeatherForcastFetcher

-(void)fetchWeatherForecast
{
    NSString *requestParams = [[NSString alloc] initWithFormat:@"lat=%@&lon=%@",self.latitude,self.longitude];
    
    dataAccessLayer = [[DataAccess alloc] init];
    dataAccessLayer.reqParams = requestParams;
    dataAccessLayer.delegate = self;
    
    [dataAccessLayer fetchDataFor:DATA_ACCESS_TYPE_WEATHER_DATA];
}

-(void)dataAccessFailedWithError:(NSString *)errorDescp
{
    if (self.delegate != nil && [self.delegate conformsToProtocol:@protocol(WeatherForecastFetcherDelegate)] &&
        [self.delegate respondsToSelector:@selector(weatherDataFetchFailed:)]) {
        [self.delegate weatherDataFetchFailed:errorDescp];
    }
}

-(void)dataAccessSuccessful:(id)receivedDataModel
{
    if (receivedDataModel != nil) {
        
        WeatherReport *weatherDetails = [[WeatherReport alloc] initReportWithDictionary:(NSDictionary *)receivedDataModel];
        
        if (self.delegate != nil && [self.delegate conformsToProtocol:@protocol(WeatherForecastFetcherDelegate)] &&
            [self.delegate respondsToSelector:@selector(weatherDataFetched:)]) {
            [self.delegate weatherDataFetched:weatherDetails];
        }
    }
}



@end
