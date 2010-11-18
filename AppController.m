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
	voiceList = [[NSSpeechSynthesizer availableVoices] retain];
	return self;
}

- (void)awakeFromNib {
	NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
	int defaultRow = [voiceList indexOfObject:defaultVoice];
	[tableView selectRowIndexes:[NSIndexSet indexSetWithIndex:defaultRow] 
		   byExtendingSelection:NO];
	[tableView scrollRowToVisible:defaultRow];
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
	[tableView setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
	NSLog(@"stopping");
	[speechSynth stopSpeaking];
}

// Delegate Methods

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender 
		didFinishSpeaking:(BOOL)complete {
	NSLog(@"complete = %d", complete);
	[stopButton setEnabled:NO];
	[startButton setEnabled:YES];
	[tableView setEnabled:YES];
}

- (int)numberOfRowsInTableView:(NSTableView *)tv {
	return [voiceList count];
}

- (id)tableView:(NSTabView *)tv 
	objectValueForTableColumn:(NSTableColumn *)tableColumn 
					      row:(int)row {
	NSString *v = [voiceList objectAtIndex:row];
	NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
	return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
	int row = [tableView selectedRow];
	if (row == -1) {
		return;
	}
	NSString *selectedVoice = [voiceList objectAtIndex:row];
	[speechSynth setVoice:selectedVoice];
	NSLog(@"new voice = %@", selectedVoice);
}

@end
