//
//  ViewController.m
//  Accel
//
//  Created by DOUGLAS STARNES on 8/23/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize cmm;
@synthesize circle;

-(CGFloat)normalizeScaleFactor:(CGFloat)scaleFactor
{
    CGFloat normalizedScaleFactor = MIN(ABS(scaleFactor), 0.5);
    if (scaleFactor < 0.0)
        return normalizedScaleFactor * -1.0;
    return normalizedScaleFactor;
}

- (void)update:(CMAcceleration)accelerationData
{
    CGFloat normX = [self normalizeScaleFactor:accelerationData.x];
    CGFloat normY = [self normalizeScaleFactor:accelerationData.y];
    CGFloat normZ = [self normalizeScaleFactor:accelerationData.z];
    self.circle.center = CGPointMake(normX, normY);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    circle = [[CircleView alloc] initWithFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
    circle.center = self.view.center;
    [self.view addSubview:circle];
    self.cmm = [[CMMotionManager alloc] init];
    NSOperationQueue *updateQueue = [[NSOperationQueue alloc] init];
    self.cmm.accelerometerUpdateInterval = 1.0 / 10.0;
    [self.cmm startAccelerometerUpdatesToQueue:updateQueue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        CGFloat normX = [self normalizeScaleFactor:accelerometerData.acceleration.x];
        CGFloat normY = [self normalizeScaleFactor:accelerometerData.acceleration.y];
        CGFloat normZ = [self normalizeScaleFactor:accelerometerData.acceleration.z];
        NSLog(@"%f, %f, %f", normX, normY, normZ);
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
