//
//  AppController.h
//  SpeakLine
//
//  Created by Xiao G. Wu on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject <NSSpeechSynthesizerDelegate, NSTableViewDelegate> {
	IBOutlet NSTextField *textField;
	NSSpeechSynthesizer *speechSynth;
	
	IBOutlet NSButton *stopButton;
	IBOutlet NSButton *startButton;
	
	IBOutlet NSTableView *tableView;
	NSArray *voiceList;

}
- (IBAction)sayIt:(id)sender;
- (IBAction)stopIt:(id)sender;
@end
