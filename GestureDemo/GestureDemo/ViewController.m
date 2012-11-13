//
//  ViewController.m
//  GestureDemo
//
//  Created by DOUGLAS STARNES on 8/27/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "ViewController.h"
#import "TapViewController.h"
#import "RotateViewController.h"
#import "PinchViewController.h"
#import "SwipeViewController.h"

@interface ViewController ()
{
    NSArray *demos;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    demos = @[
        @"Tap",
        @"Rotate",
        @"Pinch",
        @"Swipe"
    ];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [demos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = [demos objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedRowTitle = [demos objectAtIndex:indexPath.row];
    if (selectedRowTitle == @"Tap") {
        TapViewController *tvc = [[TapViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
    } else if (selectedRowTitle == @"Rotate") {
        RotateViewController *rvc = [[RotateViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    } else if (selectedRowTitle == @"Swipe") {
        SwipeViewController *swc = [[SwipeViewController alloc] init];
        [self.navigationController pushViewController:swc animated:YES];
    } else {
        PinchViewController *pvc = [[PinchViewController alloc] init];
        [self.navigationController pushViewController:pvc animated:YES];
    }
}

@end
