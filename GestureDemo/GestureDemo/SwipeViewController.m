//
//  SwipeViewController.m
//  GestureDemo
//
//  Created by DOUGLAS STARNES on 8/28/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetectedLeft:)];
    recognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    recognizerLeft.numberOfTouchesRequired = 1;
    recognizerLeft.delegate = self;
    
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetectedRight:)];
    recognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    recognizerRight.numberOfTouchesRequired = 1;
    recognizerRight.delegate = self;
    
    UISwipeGestureRecognizer *recognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetectedUp:)];
    recognizerUp.direction = UISwipeGestureRecognizerDirectionUp;
    recognizerUp.numberOfTouchesRequired = 2;
    recognizerUp.delegate = self;
    
    UISwipeGestureRecognizer *recognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetectedDown:)];
    recognizerDown.direction = UISwipeGestureRecognizerDirectionDown;
    recognizerDown.numberOfTouchesRequired = 2;
    recognizerDown.delegate = self;
    
    [self.view addGestureRecognizer:recognizerDown];
    [self.view addGestureRecognizer:recognizerUp];
    [self.view addGestureRecognizer:recognizerLeft];
    [self.view addGestureRecognizer:recognizerRight];
    
    self.swiped.text = @"";
    self.direction.text = @"";
}

- (void)swipeDetectedLeft:(UISwipeGestureRecognizer *)r
{
    if (r.state == UIGestureRecognizerStateRecognized) {
        self.swiped.text = @"SWIPED";
        self.direction.text = @"LEFT";
    }
}

- (void)swipeDetectedRight:(UISwipeGestureRecognizer *)r
{
    if (r.state == UIGestureRecognizerStateRecognized) {
        self.swiped.text = @"SWIPED";
        self.direction.text = @"RIGHT";
    }
}

- (void)swipeDetectedUp:(UISwipeGestureRecognizer *)r
{
    if (r.state == UIGestureRecognizerStateRecognized) {
        self.swiped.text = @"SWIPED";
        self.direction.text = @"UP";
    }
}

- (void)swipeDetectedDown:(UISwipeGestureRecognizer *)r
{
    if (r.state == UIGestureRecognizerStateRecognized) {
        self.swiped.text = @"SWIPED";
        self.direction.text = @"DOWN";
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
