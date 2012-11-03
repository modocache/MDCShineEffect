//  UIView+MDCShineEffect.m
//
//  Copyright (c) 2012 modocache
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import "UIView+MDCShineEffect.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>


@implementation UIView (MDCShineEffect)


#pragma mark - Public Interface

- (void)shine {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;

    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    CALayer *shineLayer = [CALayer layer];
    UIImage *shineImage = [self highlightedImageForImage:viewImage];
    shineLayer.contents = (id) shineImage.CGImage;
    shineLayer.frame = CGRectMake(0, 1, width, height);

    CALayer *mask = [CALayer layer];
    mask.backgroundColor = [UIColor clearColor].CGColor;
    UIImage *maskImage = [self maskImageForImage:viewImage];
    mask.contents = (id) maskImage.CGImage;
    mask.contentsGravity = kCAGravityCenter;
    mask.frame = CGRectMake(-width, 0, width * 1.25, height);

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    anim.byValue = @(width * 2);
    anim.repeatCount = HUGE_VALF;
    anim.duration = 3.0f;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [self.layer addSublayer:shineLayer];
    shineLayer.mask = mask;

    [mask addAnimation:anim forKey:@"shine"];
}


#pragma mark - Internal Methods

- (UIImage *)highlightedImageForImage:(UIImage *)image {
    CIImage *beginImage = [CIImage imageWithCGImage:image.CGImage];
    CIImage *output = [CIFilter filterWithName:@"CIColorControls"
                                        keysAndValues:kCIInputImageKey, beginImage,
                                                      @"inputBrightness", @1.0f,
                                                      nil].outputImage;

    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:output fromRect:output.extent];
    UIImage *newImage = [UIImage imageWithCGImage:cgImage];

    CGImageRelease(cgImage);

    return newImage;
}

- (UIImage *)maskImageForImage:(UIImage *)image {
    CGFloat maskWidth = floorf(image.size.width/3);
    CGFloat maskHeight = floorf(image.size.height);

    UIGraphicsBeginImageContext(CGSizeMake(maskWidth, maskHeight));

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef clearColor = [UIColor clearColor].CGColor;
    CGColorRef blackColor = [UIColor blackColor].CGColor;

    CGFloat locations[] = { 0.0f, 0.5f, 1.0f };
    NSArray *colors = @[ (__bridge id)clearColor, (__bridge id)blackColor, (__bridge id)clearColor ];

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (__bridge CFArrayRef)colors,
                                                        locations);
    CGFloat midY = floorf(maskHeight/2);
    CGPoint startPoint = CGPointMake(0, midY);
    CGPoint endPoint = CGPointMake(floorf(maskWidth/2), midY);

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    CFRelease(gradient);
    CFRelease(colorSpace);

    UIImage *maskImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return maskImage;
}

@end
