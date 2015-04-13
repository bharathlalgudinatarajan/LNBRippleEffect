LNBRippleEffect
===============

Create a Tinder-like button with ripple animation.

<IMG SRC="https://github.com/lnbharath/LNBRippleEffect/blob/0.1.0/Demo/LNBRippleEffect.gif">


#Installation

##Using Cocoapods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like LNBRippleEffect in your projects. 

###Podfile

~~~~~~~~
pod 'LNBRippleEffect'
~~~~~~~~

##Normal Installation

1. Download the zip file. 
2. Add **LNBRippleEffect.h** and **LNBRippleEffect.m** files to your workspace
3. Select 'Copy items if needed' option

#Usage 

Import LNBRippleEffect.h
~~~~~~~~
#import "LNBRippleEffect.h"
~~~~~~~~

Add the following code to your ViewController and you're good to go.

~~~~~~~~
LNBRippleEffect *rippleEffect = [[LNBRippleEffect alloc]initWithImage:[UIImage imageNamed:@""] Frame:CGRectMake(110, 200, 100, 100) Color:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:1] Target:@selector(buttonTapped:) ID:self];
[rippleEffect setRippleColor:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:1]];
[rippleEffect setRippleTrailColor:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:0.5]];
[self.view addSubview:rippleEffect];
~~~~~~~~

#Customization 

###LNBRippleEffect is highly customizable

1. Add an image to the button 
2. Change the button's border by editing the initWithImage's Color argument 
3. Change the color of ripples by setting custom RGB values to UIColor property of **setRippleColor**
4. Change the color of ripple trails by setting custom RGB values to UIColor property of **setRippleTrailColor**

#Author

Bharath Lalgudi Natarajan([@lnbharath](http://twitter.com/lnbharath ""))

#Contact 

Mail- iosdevbharath@gmail.com

#Licence 

LNBRippleEffect is available under the MIT license. See the LICENSE file for more info.


