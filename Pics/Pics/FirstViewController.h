//
//  FirstViewController.h
//  Pics
//
//  Created by DOUGLAS STARNES on 8/12/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstViewController : UIViewController
    <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

- (IBAction)takePicture:(id)sender;

@end
