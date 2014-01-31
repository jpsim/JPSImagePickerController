//
//  JPSCameraButton.m
//  JPSImagePickerController
//
//  Created by JP Simard on 1/31/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSCameraButton.h"
#import "UIImage+DrawBlock.h"

@implementation JPSCameraButton

+ (instancetype)button {
    JPSCameraButton *button = [JPSCameraButton buttonWithType:UIButtonTypeSystem];
    if (self) {
        button.tintColor = [UIColor whiteColor];
        UIImageView *bgView = [[UIImageView alloc] initWithImage:[button outerRingImage]];
        [button insertSubview:bgView atIndex:0];
        [button setBackgroundImage:[button innerCircle] forState:UIControlStateNormal];
    }
    return button;
}

- (UIImage *)outerRingImage {
    static UIImage *_image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _image = [UIImage imageWithSize:CGSizeMake(66.0f, 66.0f) drawBlock:^(CGContextRef context, CGSize size) {
            UIBezierPath *outerRingPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(3, 3, 60, 60)];
            [self.tintColor setStroke];
            outerRingPath.lineWidth = 6;
            [outerRingPath stroke];
        }];
    });
    return _image;
}

- (UIImage *)innerCircle {
    static UIImage *_image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _image = [UIImage imageWithSize:CGSizeMake(66.0f, 66.0f) drawBlock:^(CGContextRef context, CGSize size) {
            UIBezierPath *innerCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(8, 8, 50, 50)];
            [self.tintColor setFill];
            [innerCirclePath fill];
        }];
    });
    return _image;
}

@end
