//
//  LNBRippleEffect.h
//  LNBRippleEffect
//
//  Created by BHARATH Lalgudi Natarajan on 25/12/14.
//  Copyright (c) 2014 Bharath. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>



@interface LNBRippleEffect : UIView{

    UIImageView *buttonImage;
    UITapGestureRecognizer *tapGesture;
    SEL selectedMethod;
    id senderid;
    UIColor *rippleColor;
   UIColor *bordercolor;
    UIColor *rippleTrailColor;
    NSArray *rippleColors;
    
}
typedef void (^onFinish)(BOOL success);
@property (nonatomic, copy) onFinish block;
-(instancetype)initWithImage:(UIImage *)image Frame:(CGRect)frame Color:(UIColor*)bordercolor Target:(SEL)action ID:(id)sender;
-(instancetype)initWithImage:(UIImage *)image Frame:(CGRect)frame didEnd:(onFinish)executeOnFinish;
-(void)setRippleColor:(UIColor *)color;
-(void)setRippleTrailColor:(UIColor *)color;

@end

