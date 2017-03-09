//
//  DataAccessHelper.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAccessLayerConstants.h"

typedef NS_ENUM(NSUInteger, DataAceesType)
{
    DATA_ACCESS_TYPE_WEATHER_DATA = 0,
    DATA_ACCESS_TYPE_NONE
};

@interface DataAccessHelper : NSObject

-(NSString *)urlStringForDataAccessType:(DataAceesType)reqType;

@end
