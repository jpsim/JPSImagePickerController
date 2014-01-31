//
//  JPSViewController.m
//  JPSImagePickerControllerDemo
//
//  Created by JP Simard on 1/31/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSViewController.h"
#import "JPSImagePickerController.h"

@interface JPSViewController () <JPSImagePickerDelegate>

@property (nonatomic, strong) UIButton    *button;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JPSViewController

#pragma mark - UI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupButton];
    [self setupImageView];
}

- (void)setupButton {
    // Button
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"Launch Image Picker" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(launchImagePicker) forControlEvents:UIControlEventTouchUpInside];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_button];
    
    // Constraints
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_button
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0f
                                                                constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_button
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0f
                                                                constant:0];
    [self.view addConstraints:@[centerX, centerY]];
}

- (void)setupImageView {
    // Image View
    _imageView = [[UIImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    // Constraints
    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_button][_imageView]|"
                                                                options:0
                                                                metrics:nil
                                                                  views:NSDictionaryOfVariableBindings(_button, _imageView)];
    NSArray *horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"|[_imageView]|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(_imageView)];
    [self.view addConstraints:vertical];
    [self.view addConstraints:horizontal];
}

#pragma mark - Actions

- (void)launchImagePicker {
    JPSImagePickerController *imagePicker = [[JPSImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - JPSImagePickerControllerDelegate

- (void)picker:(JPSImagePickerController *)picker didTakePicture:(UIImage *)picture {
    picker.confirmationString = @"Zoom in to make sure you're happy with your picture";
    picker.confirmationOverlayString = @"Analyzing Image...";
    picker.confirmationOverlayBackgroundColor = [UIColor orangeColor];
    double delayInSeconds = 1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        picker.confirmationOverlayString = @"Good Quality";
        picker.confirmationOverlayBackgroundColor = [UIColor colorWithRed:0 green:0.8f blue:0 alpha:1.0f];
    });
}

- (void)picker:(JPSImagePickerController *)picker didConfirmPicture:(UIImage *)picture {
    self.imageView.image = picture;
}

@end
