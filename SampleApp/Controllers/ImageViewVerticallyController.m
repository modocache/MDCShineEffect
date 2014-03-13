//  ImageViewVerticallyController.m
//
//  Copyright (c) 2012 modocache
//
//  Added by StoneArk, 2014-01-24
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


#import "ImageViewVerticallyController.h"
#import "UIView+MDCShineEffect.h"


@interface ImageViewVerticallyController ()

@end


@implementation ImageViewVerticallyController


#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"UIImageView", nil);

    UIImage *image = [UIImage imageNamed:@"open-source-initiative-logo.png"];
    CGRect imageViewRect = CGRectMake(floorf((self.view.frame.size.width - image.size.width)/2),
                                      floorf((self.view.frame.size.height
                                              - image.size.height
                                              - self.navigationController.navigationBar.frame.size.height)/2),
                                      image.size.width,
                                      image.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewRect];
    imageView.image = image;
    
    [imageView shineVerticallyWithRepeatCount:HUGE_VALF duration:1.5 maskHeight:200.0f];

    [self.view addSubview:imageView];
}

@end
