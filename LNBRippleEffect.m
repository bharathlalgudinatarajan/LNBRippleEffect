//
//  LNBRippleEffect.m
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


#import <QuartzCore/QuartzCore.h>
#import "LNBRippleEffect.h"

@implementation LNBRippleEffect

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

-(void)drawImageWithFrame:(UIImage *)image Frame:(CGRect)frame Color:(UIColor*)bordercolor{
    
    buttonImage = [[UIImageView alloc]initWithImage:image];
    buttonImage.frame = CGRectMake(0, 0, frame.size.width-5, frame.size.height-5);
    buttonImage.layer.borderColor = [UIColor clearColor].CGColor;
    buttonImage.layer.borderWidth = 3;
    buttonImage.clipsToBounds = YES;
    buttonImage.layer.cornerRadius = buttonImage.frame.size.height/2;
    [self addSubview:buttonImage];
    
    buttonImage.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.borderWidth = 5;
    self.layer.borderColor = bordercolor.CGColor;
    
    tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonTapped:)];
    [self addGestureRecognizer:tapGesture];
    [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(continuoousripples) userInfo:nil repeats:YES];
    
}


-(instancetype)initWithImage:(UIImage *)image
                    Frame:(CGRect)frame
                    Color:(UIColor*)bordercolor
                   Target:(SEL)action
                       ID:(id)sender {
    self = [super initWithFrame:frame];
    
    if(self){
        [self drawImageWithFrame:image Frame:frame Color:bordercolor];
        selectedMethod = action;
        senderid = sender;
    }
    
    return self;
}

-(instancetype)initWithImage:(UIImage *)image Frame:(CGRect)frame didEnd:(onFinish)executeOnFinish {
    self = [super initWithFrame:frame];
    
    if(self){
        
        [self drawImageWithFrame:image Frame:frame Color:bordercolor];
        self.block = executeOnFinish;
    }
    
    return self;
}


-(void)setRippleColor:(UIColor *)color {
    rippleColor = color;
}

-(void)setRippleTrailColor:(UIColor *)color {
    rippleTrailColor = color;
}

-(void)buttonTapped:(id)sender {
        CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:self.layer.cornerRadius];
        
    
        CGPoint shapePosition = [self convertPoint:self.center fromView:nil];
        
        CAShapeLayer *circleShape = [CAShapeLayer layer];
        circleShape.path = path.CGPath;
        circleShape.position = shapePosition;
        circleShape.fillColor = rippleTrailColor.CGColor;
        circleShape.opacity = 0;
        circleShape.strokeColor = rippleColor.CGColor;
        circleShape.lineWidth = 3;
        
        [self.layer addSublayer:circleShape];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.5, 2.5, 1)];
        
        CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        alphaAnimation.fromValue = @1;
        alphaAnimation.toValue = @0;
        
        CAAnimationGroup *animation = [CAAnimationGroup animation];
        animation.animations = @[scaleAnimation, alphaAnimation];
        animation.duration = 2.0f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [circleShape addAnimation:animation forKey:nil];
    
    
    [UIView animateWithDuration:1.1 animations:^{
        buttonImage.alpha = 0.4;
        self.layer.borderColor = rippleColor.CGColor;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:2.2 animations:^{           //Edit animateWithDuration value to change ripple animtion time
            buttonImage.alpha = 1;
            self.layer.borderColor = rippleColor.CGColor;
        }completion:^(BOOL finished) {
            if([senderid respondsToSelector:selectedMethod]){
                [senderid performSelectorOnMainThread:selectedMethod withObject:nil waitUntilDone:NO];
            }
            
            if(_block) {
                BOOL success= YES;
                _block(success);
            }
        }];
        
    }];
}



-(void)continuoousripples
{
    CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:self.layer.cornerRadius];
    CGPoint shapePosition = [self convertPoint:self.center fromView:nil];
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path.CGPath;
    circleShape.position = shapePosition;
    circleShape.fillColor = rippleTrailColor.CGColor;
    circleShape.opacity = 0;
    circleShape.strokeColor = rippleColor.CGColor;
    circleShape.lineWidth = 2;
    
    [self.layer addSublayer:circleShape];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.5, 2.5, 1)];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[scaleAnimation, alphaAnimation];
    animation.duration = 2.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [circleShape addAnimation:animation forKey:nil];
}


@end
