//  UIView+MDCShineEffect.h
//
//  Copyright (c) 2012 modocache
//
//  Modified by StoneArk, 2014-01-24
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


#import <UIKit/UIKit.h>

/// UIView(MDCShineEffect) gives any view the capability to perform a "shine" animation.
/// It requires `QuartzCore` in order to perform the animation, and `CoreImage` in order
/// to generate the images used.
@interface UIView (MDCShineEffect)

/// Perform a "shine" animation on the view (with the horizontal direction as the default).
/// This is equivalent to calling shineWithRepeatCount: with a value of 0.
/// @warning When generating the "shine" animation, several images are created and processed. These are only created once for each time shine or related methods are called. Therefore, performance and battery life will suffer when using this method repeatedly, as opposed to calling shineWithRepeatCount: or similar methods.
- (void)shine;

/// Perform a "shine" animation on the view as many times as specified in the repeat count.
/// @param repeatCount The number of times the "shine" animation should repeat itself. If this value is zero, the animation will only occur once. To repeat indefinitely, use `HUGE_VALF`.
- (void)shineWithRepeatCount:(float)repeatCount;

/// Perform a "shine" animation on the view with the specified duration, and repeat as specified.
/// @param repeatCount The number of times the "shine" animation should repeat itself. If this value is zero, the animation will only occur once.
/// @param duration The duration of the animation.
- (void)shineWithRepeatCount:(float)repeatCount duration:(CFTimeInterval)duration;

/// Perform a "shine" animation on the view with the specified duration, and repeat as specified.
/// @param repeatCount The number of times the "shine" animation should repeat itself. If this value is zero, the animation will only occur once.
/// @param duration The duration of the animation.
/// @param maskWidth The width of the "shine" mask applied to the view. For best results, specify a value less than the width of the view itself.
- (void)shineWithRepeatCount:(float)repeatCount
                    duration:(CFTimeInterval)duration
                   maskWidth:(CGFloat)maskWidth;

/// Perform a "shine" animation on the view, with the horizontal direction.
/// If you simply call the methods above, it will use the horizontal direction as the default.
- (void)shineHorizontally;
- (void)shineHorizontallyWithRepeatCount:(float)repeatCount;
- (void)shineHorizontallyWithRepeatCount:(float)repeatCount duration:(CFTimeInterval)duration;
- (void)shineHorizontallyWithRepeatCount:(float)repeatCount
                                duration:(CFTimeInterval)duration
                               maskWidth:(CGFloat)maskWidth;

/// Perform a "shine" animation on the view, with the vertical direction.
- (void)shineVertically;
- (void)shineVerticallyWithRepeatCount:(float)repeatCount;
- (void)shineVerticallyWithRepeatCount:(float)repeatCount duration:(CFTimeInterval)duration;
- (void)shineVerticallyWithRepeatCount:(float)repeatCount
                              duration:(CFTimeInterval)duration
                            maskHeight:(CGFloat)maskHeight;

@end
