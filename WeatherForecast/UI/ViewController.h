//
//  ViewController.h
//  WeatherForecast
//
//  Created by Pranav on 09/03/17.
//  Copyright © 2017 Pranav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)IBOutlet UILabel *dateLabel;
@property(nonatomic,weak)IBOutlet UILabel *cityName;
@property(nonatomic,weak)IBOutlet UILabel *weatherConditionLabel;
@property(nonatomic,weak)IBOutlet UILabel *tempLabel;

@property(nonatomic,weak)IBOutlet UIButton *day1Button;
@property(nonatomic,weak)IBOutlet UIButton *day2Button;
@property(nonatomic,weak)IBOutlet UIButton *day3Button;
@property(nonatomic,weak)IBOutlet UIButton *day4Button;
@property(nonatomic,weak)IBOutlet UIButton *day5Button;

@property(nonatomic,weak)IBOutlet UITableView *weatherDetailsTable;

-(IBAction)day1Selected:(id)sender;
-(IBAction)day2Selected:(id)sender;
-(IBAction)day3Selected:(id)sender;
-(IBAction)day4Selected:(id)sender;
-(IBAction)day5Selected:(id)sender;

@end

