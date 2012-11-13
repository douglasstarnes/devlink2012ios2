//
//  ViewController.m
//  AppSettings
//
//  Created by DOUGLAS STARNES on 8/26/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"rememberPassword"] == YES)
    {
        self.rememberPassword.text = @"Your password is being saved";
        self.password.text = [defaults stringForKey:@"password"];
    } else {
        self.rememberPassword.text = @"Your password is not being saved";
        self.password.text = @"";
    }
}

- (IBAction)switchToMainView:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:self.settingsPassword.text forKey:@"password"];
    [defaults setBool:self.settingsRememberPassword.on forKey:@"rememberPassword"];
    
    if ([defaults boolForKey:@"rememberPassword"] == YES)
    {
        self.rememberPassword.text = @"Your password is being saved";
        self.password.text = [defaults stringForKey:@"password"];
    } else {
        self.rememberPassword.text = @"Your password is not being saved";
        self.password.text = @"";
    }
    
    [UIView transitionFromView:self.settingsView
                        toView:self.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:^(BOOL finished) {
                        // pass
                    }];
}

- (IBAction)switchToSettingsView:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"rememberPassword"] == YES)
    {
        self.settingsRememberPassword.on = YES;
        self.settingsPassword.text = [defaults stringForKey:@"password"];
    } else {
        self.settingsRememberPassword.on = NO;
        self.settingsPassword.text = @"";
    }
    [UIView transitionFromView:self.view
                        toView:self.settingsView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL finished) {
                        // pass
                    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
