//
//  WeatherForcastFetcher.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WeatherForecastFetcherDelegate <NSObject>

-(void)weatherDataFetched:(id)data;
-(void)weatherDataFetchFailed:(NSString *)errorDesc;

@end

@interface WeatherForcastFetcher : NSObject

@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *longitude;

@property(nonatomic,weak)id<WeatherForecastFetcherDelegate> delegate;

-(void)fetchWeatherForecast;

@end
