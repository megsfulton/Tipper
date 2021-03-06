# Tipper
Prework for iOS (Swift) for Designers

Tipper is a tip calculator application for iOS.

Submitted by: Megs Fulton

Time spent: 30 hours spent in total

## User Stories

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] UI animations
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
- [x] The screen brightness is detected on launch to display a light or dark UI depending on the light level of the environment
- [x] Manual changes in screen brightness are detected and the UI color adjusts accordingly 
- [x] Two finger swipe up to change the UI to be light. Two finger swipe down to change the UI to be dark
- [x] Ability to split the bill between 1-4 people
- [x] Custom Keyboard
- [x] Appending “$” to the beginning of the bill amount 
- [x] Disabling "0" or "." from being the first entry in the bill field

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<a href="https://www.dropbox.com/s/tuxx5rj8fe9t079/TipperVideo.mp4" target="_blank"><img src='https://github.com/megsfulton/Tipper/blob/master/Tipper.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /></a>

GIF created with [LiceCap](http://www.cockos.com/licecap/). 
Video created with [Reflector](http://www.airsquirrels.com/reflector/features/mac/). 

## Notes

Changes in Screen Brightness
Detecting changes in screen brightness to change the UI colors was particularly challenging because it required implementing NSNotifications, which seemed straightforward at first. However, most of the documentation was written in Objective-C and or Swift 2.0. I also wanted the user to be able to quickly change the color of the UI through a swipe gesture. This took quite a bit of trial and error with different methods of detecting gestures on the view control, I eventually found a solution that was simple and straightforward. 

Custom Keyboard 
There are a number of tutorials on how to create a system wide custom keyboard and I started by trying to follow one that used an XIB in a separate view class. I soon found it to be unnecessarily complex for my purposes given that my design had the keypad persist regardless of whether or not the billField was active. I ended up using the core components from the XIB tutorial and moving them into my main view controller where I had to modify the code to not use the Keyboard Delegate and disable the bill field so that the system keypad wouldn’t be called on touch. 

Appending $ to the beginning of the bill field
I thought this would be a fairly straightforward detail to add but it required quite a bit of management of the billField string by detecting the length of the string and appending or removing the $ depending on whether or not a number was entered in the field. 

## License

    Copyright [2017] [Megs Fulton]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
