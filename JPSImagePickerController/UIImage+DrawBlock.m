//
//  UIImage+DrawBlock.m
//  JPSImagePickerController
//
//  Created by JP Simard on 1/31/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "UIImage+DrawBlock.h"

@implementation UIImage (DrawBlock)

+ (UIImage *)imageWithSize:(CGSize)size drawBlock:(DrawBlock)drawBlock {
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (drawBlock) drawBlock(context, size);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
