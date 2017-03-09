//
//  WeatherRecord.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherRecord : NSObject

@property(nonatomic,strong)NSString *cloudiness;
@property(nonatomic,strong)NSString *temp;
@property(nonatomic,strong)NSString *humidity;
@property(nonatomic,strong)NSString *weatherDesc;
@property(nonatomic,strong)NSString *date;
@property(nonatomic,strong)NSString *time;

@end
