//
//  DataAccessHelper.m
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import "DataAccessHelper.h"
#import "DataAccessLayerConstants.h"

@implementation DataAccessHelper

-(NSString *)urlStringForDataAccessType:(DataAceesType)reqType
{
    NSString *returnUrl = nil;
    if (reqType == DATA_ACCESS_TYPE_WEATHER_DATA) {
        returnUrl = WEATHER_DATA_COMPLETE_URL;
    }
    return returnUrl;
}

@end
