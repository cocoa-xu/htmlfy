//
//  ViewController.h
//  htmlfy
//
//  Created by Cocoa on 19/09/2023.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTextViewDelegate>

@property (unsafe_unretained) IBOutlet NSTextView *attributedTextView;
@property (unsafe_unretained) IBOutlet NSTextView *htmlCodeView;

@end
