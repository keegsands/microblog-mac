//
//  RFAccountPopoverBox.m
//  Snippets
//
//  Created by Manton Reece on 3/24/18.
//  Copyright © 2018 Riverfold Software. All rights reserved.
//

#import "RFAccountPopoverBox.h"

#import "RFSettings.h"
#import "RFAccount.h"
#import "RFConstants.h"

@implementation RFAccountPopoverBox

- (void) awakeFromNib
{
	self.savedFillColor = self.fillColor;
}

- (void) updateTrackingAreas
{
	if (self.customTrackingArea) {
		[self removeTrackingArea:self.customTrackingArea];
	}

	self.customTrackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveInKeyWindow | NSTrackingMouseMoved | NSTrackingMouseEnteredAndExited owner:self userInfo:nil];
	[self addTrackingArea:self.customTrackingArea];
}

- (BOOL) hasMultipleAccounts
{
	return [RFSettings accounts].count > 1;
}

- (void) mouseDown:(NSEvent *)event
{
	if ([self hasMultipleAccounts]) {
		NSMenu* menu = [[NSMenu alloc] initWithTitle:@"Accounts"];
		
		NSArray* accounts = [RFSettings accounts];
		for (RFAccount* a in accounts) {
			NSString* s = [NSString stringWithFormat:@"@%@", a.username];
			NSMenuItem* item = [[NSMenuItem alloc] initWithTitle:s action:@selector(switchAccount:) keyEquivalent:@""];
			item.representedObject = a;
			[menu addItem:item];
		}

		[NSMenu popUpContextMenu:menu withEvent:event forView:self];
	}
}

- (void) switchAccount:(NSMenuItem *)item
{
	RFAccount* a = item.representedObject;
	[[NSNotificationCenter defaultCenter] postNotificationName:kSwitchAccountNotification object:self userInfo:@{ kSwitchAccountUsernameKey: a.username }];
}

- (void) mouseEntered:(NSEvent *)event
{
	if ([self hasMultipleAccounts]) {
		self.fillColor = [NSColor colorWithWhite:0.7 alpha:0.5];
	}
}

- (void) mouseExited:(NSEvent *)event
{
	self.fillColor = self.savedFillColor;
}

@end
