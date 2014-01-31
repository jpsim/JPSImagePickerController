//
//  JPSImagePickerController.h
//  JPSImagePickerController
//
//  Created by JP Simard on 1/31/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JPSImagePickerDelegate;

@interface JPSImagePickerController : UIViewController

#pragma mark - Feature Flags

// Confirmation screen enabled, default YES
@property (nonatomic, assign) BOOL editingEnabled;
// Zooming in confirmation screen enabled, default YES
@property (nonatomic, assign) BOOL zoomEnabled;
// Volume up button as trigger enabled, default YES
@property (nonatomic, assign) BOOL volumeButtonTakesPicture;

#pragma mark - Confirmation Overlay Options

// String shown above image in confirmation screen, default nil
@property (nonatomic, copy)   NSString *confirmationString;
// String shown overlayed on image in confirmation screen, default nil
@property (nonatomic, copy)   NSString *confirmationOverlayString;
// Background color of string shown overlayed on image in confirmation screen, default nil
@property (nonatomic, strong) UIColor  *confirmationOverlayBackgroundColor;

#pragma mark - Delegate

@property (nonatomic, weak) id<JPSImagePickerDelegate> delegate;

@end

#pragma mark - Protocol

@protocol JPSImagePickerDelegate <NSObject>

@optional

// Called immediately after the picture was taken
- (void)picker:(JPSImagePickerController *)picker didTakePicture:(UIImage *)picture;
// Called immediately after the "Use" button was tapped
- (void)picker:(JPSImagePickerController *)picker didConfirmPicture:(UIImage *)picture;

@end
