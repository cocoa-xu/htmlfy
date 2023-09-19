//
//  ViewController.m
//  htmlfy
//
//  Created by Cocoa on 19/09/2023.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.attributedTextView.delegate = self;
}

- (NSString *)keepBody:(NSString *)plainHTMLCode {
    NSString * string = plainHTMLCode;
    NSString * pattern;

    pattern = @"<body>\n(.*)\n</body>";

    NSError * error = nil;
    NSRegularExpression * regex =  [[NSRegularExpression alloc] initWithPattern:pattern options:(NSRegularExpressionAnchorsMatchLines) error:&error];
    if (!error) {
        NSTextCheckingResult * result = [regex firstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
        if (result != nil){
            NSString * body = [string substringWithRange: result.range];
            return [body substringWithRange:NSMakeRange(7, body.length - 14)];
        }
    } else {
        NSLog(@"error: %@", error);
    }
    return @"";
}

- (void)textDidChange:(NSNotification *)notification {
    if (notification.object == self.attributedTextView) {
        NSDictionary *documentAttributes = @{
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSExcludedElementsDocumentAttribute: @[@"style"]
        };
        NSAttributedString * attributedString = self.attributedTextView.attributedString;
        NSData *htmlData = [attributedString dataFromRange:NSMakeRange(0, attributedString.length) documentAttributes:documentAttributes error:NULL];
        NSString * plainHTMLCode = [self keepBody:[[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding]];
        NSAttributedString * htmlCode = [[NSAttributedString alloc] initWithString:plainHTMLCode attributes:@{NSFontAttributeName: [NSFont fontWithName:@"Menlo" size:12.0f]}];
        [[self.htmlCodeView textStorage] setAttributedString:htmlCode];
    }
}

@end
