//
//  RFPhotoCell.m
//  Snippets
//
//  Created by Manton Reece on 10/12/17.
//  Copyright © 2017 Riverfold Software. All rights reserved.
//

#import "RFPhotoCell.h"

#import "RFUpload.h"

@implementation RFPhotoCell

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	[self setupBrowser];
}

- (void) setupBrowser
{
	NSString* browser_s = @"Open in Browser";
	
	NSURL* example_url = [NSURL URLWithString:@"https://micro.blog/"];
	NSURL* app_url = [[NSWorkspace sharedWorkspace] URLForApplicationToOpenURL:example_url];
	if ([app_url.lastPathComponent containsString:@"Chrome"]) {
		browser_s = @"Open in Chrome";
	}
	else if ([app_url.lastPathComponent containsString:@"Firefox"]) {
		browser_s = @"Open in Firefox";
	}
	else if ([app_url.lastPathComponent containsString:@"Safari"]) {
		browser_s = @"Open in Safari";
	}

	self.browserMenuItem.title = browser_s;
}

- (void) disableMenu
{
	self.selectionOverlayView.menu = nil;
}

- (IBAction) openInBrowser:(id)sender
{
	NSURL* url = [NSURL URLWithString:self.url];
	[[NSWorkspace sharedWorkspace] openURL:url];
}

- (IBAction) copyLink:(id)sender
{
	NSPasteboard* pb = [NSPasteboard generalPasteboard];
	[pb clearContents];
	[pb setString:self.url forType:NSPasteboardTypeString];
}

- (IBAction) copyHTML:(id)sender
{
	NSString* s;
	
	RFUpload* up = [[RFUpload alloc] initWithURL:self.url];
	if ([up isPhoto]) {
		s = [NSString stringWithFormat:@"<img src=\"%@\">", self.url];
	}
	else if ([up isVideo]) {
		s = [NSString stringWithFormat:@"<video src=\"%@\" controls=\"controls\" playsinline=\"playsinline\" preload=\"none\"></video>", self.url];
	}
	else if ([up isAudio]) {
		s = [NSString stringWithFormat:@"<audio src=\"%@\" controls=\"controls\" preload=\"metadata\">", self.url];
	}
	else {
		s = [NSString stringWithFormat:@"<img src=\"%@\">", self.url];
	}
	
	NSPasteboard* pb = [NSPasteboard generalPasteboard];
	[pb clearContents];
	[pb setString:s forType:NSPasteboardTypeString];
}

- (IBAction) copyMarkdown:(id)sender
{
	NSString* s;

	RFUpload* up = [[RFUpload alloc] initWithURL:self.url];
	if ([up isPhoto]) {
		s = [NSString stringWithFormat:@"![](%@)", self.url];
	}
	else {
		s = [NSString stringWithFormat:@"[](%@)", self.url];
	}

	NSPasteboard* pb = [NSPasteboard generalPasteboard];
	[pb clearContents];
	[pb setString:s forType:NSPasteboardTypeString];
}

@end
