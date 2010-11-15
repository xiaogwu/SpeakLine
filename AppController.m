//
//  AppController.m
//  SpeakLine
//
//  Created by Xiao G. Wu on 11/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (id)init {
	[super init];
	
	NSLog(@"init");
	
	speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
	[speechSynth setDelegate:self];
	return self;
}

- (IBAction)sayIt:(id)sender {
	NSString *string = [textField stringValue];
	
	if ([string length] == 0) {
		NSLog(@"String from %@ is of zero-length", textField);
		return;
	}
	[speechSynth startSpeakingString:string];
	NSLog(@"Have started to say: %@", string);
	[stopButton setEnabled:YES];
	[startButton setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
	NSLog(@"stopping");
	[speechSynth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
		didFinishSpeaking:(BOOL)complete {
	NSLog(@"complete = %d", complete);
	[stopButton setEnabled:NO];
	[startButton setEnabled:YES];
}

@end
