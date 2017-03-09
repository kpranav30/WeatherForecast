//
//  TempDetailsTableViewCell.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempDetailsTableViewCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *timeLabel;
@property(nonatomic,weak)IBOutlet UILabel *weatherDetailsLabel;

@end
