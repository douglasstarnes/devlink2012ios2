//
//  ViewController.m
//  GCDAndBlocks
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

- (void)longRunningTask
{
    NSLog(@"started longRunningTask");
    [NSThread sleepForTimeInterval:2];
    NSLog(@"finished longRunningTask");
    
}

- (void)longerRunningTask
{
    NSLog(@"started longerRunningTask");
    [NSThread sleepForTimeInterval:5];
    NSLog(@"finished longerRunningTask");
}

- (IBAction)noThreads:(id)sender
{
    self.textView.text = @"Started noThreads";
    [self longRunningTask];
    [self longerRunningTask];
    self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished noThreads"];
}

- (IBAction)oneQueue:(id)sender
{
    self.textView.text = @"Started oneQueue";
    dispatch_queue_t concurrent_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(concurrent_queue, ^{
        [self longRunningTask];
        [self longerRunningTask];
    });
    self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished oneQueue"];
}

- (IBAction)mainQueue:(id)sender
{
    self.textView.text = @"Started mainQueue";
    dispatch_queue_t concurrent_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(concurrent_queue, ^{
        [self longRunningTask];
        [self longerRunningTask];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished block"];
        });
    });
    self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished mainQueue"];
}

- (IBAction)groupedTasks:(id)sender
{
    self.textView.text = @"Started groupedTasks";
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatch_get_global_queue(0, 0), ^{
        [self longRunningTask];
    });
    dispatch_group_async(dispatchGroup, dispatch_get_global_queue(0, 0), ^{
        [self longerRunningTask];
    });
    dispatch_group_notify(dispatchGroup, dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished groups"];
        });
    });
    self.textView.text = [NSString stringWithFormat:@"%@\n%@", self.textView.text, @"Finished groupedTasks"];
}
@end
