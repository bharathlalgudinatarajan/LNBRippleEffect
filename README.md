LNBRippleEffect
===============

Create a Tinder-like button with ripple animation.

#Installation

##Using Cocoapods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like LNBRippleEffects in your projects. 

###Podfile

~~~~~~~~
pod 'LNBRippleEffect'
~~~~~~~~

##Normal Installation

1. Download the zip file. 
2. Drag and drop the LNBRippleEffect.h and LNBRippleEffect.m files to your workspace
3. Select 'Copy items if needed' option

#Usage 

Add the following code to your ViewController and you're good to go.

~~~~~~~~
LNBRippleEffect *rippleButton = [[LNBRippleEffect alloc]initWithImage:[UIImage imageNamed:@""] Frame:CGRectMake(110, 200, 100, 100) Color:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:1] Target:@selector(buttonTapped:) ID:self];
[rippleButton setRippleColor:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:1]];
[rippleButton setRippleTrailColor:[UIColor colorWithRed:(28.0/255.0) green:(212.0/255.0) blue:(255.0/255.0) alpha:0.5]];
[self.view addSubview:rippleButton];
~~~~~~~~

