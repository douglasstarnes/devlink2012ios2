//
//  ViewController.h
//  AppSettings
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *settingsView;
@property (nonatomic, weak) IBOutlet UILabel *rememberPassword;
@property (nonatomic, weak) IBOutlet UILabel *password;
@property (nonatomic, weak) IBOutlet UISwitch *settingsRememberPassword;
@property (nonatomic, weak) IBOutlet UITextField *settingsPassword;

- (IBAction)switchToSettingsView:(id)sender;
- (IBAction)switchToMainView:(id)sender;

@end
