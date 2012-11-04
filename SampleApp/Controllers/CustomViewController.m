//  CustomViewController.m
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


#import "CustomViewController.h"
#import "UIView+MDCShineEffect.h"


@interface CustomViewController ()

@end


@implementation CustomViewController


#pragma mark - UIViewController Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"Custom View", nil);

    self.view.backgroundColor = [UIColor blueColor];

    CGSize viewSize = CGSizeMake(100.0f, 100.0f);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - viewSize.width/2,
                                                            floorf((self.view.frame.size.height
                                                                    - viewSize.height
                                                                    - self.navigationController.navigationBar.frame.size.height)/2),
                                                            viewSize.width,
                                                            viewSize.height)];
    view.backgroundColor = [UIColor blackColor];
    [view shineWithRepeatCount:HUGE_VALF];
    [self.view addSubview:view];

    [self.view shineWithRepeatCount:HUGE_VALF duration:4.0 maskWidth:400.0f];
}

@end
