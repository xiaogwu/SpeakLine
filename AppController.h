//
//  AppController.h
//  SpeakLine
//
//  Created by Xiao G. Wu on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	IBOutlet NSTextField *textField;
	NSSpeechSynthesizer *speechSynth;

}
- (IBAction)sayIt:(id)sender;
- (IBAction)stopIt:(id)sender;
@end
