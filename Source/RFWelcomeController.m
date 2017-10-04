//
//  RFWelcomeController.m
//  Snippets
//
//  Created by Manton Reece on 10/3/17.
//  Copyright © 2017 Riverfold Software. All rights reserved.
//

#import "RFWelcomeController.h"

@implementation RFWelcomeController

- (instancetype) init
{
	self = [super initWithWindowNibName:@"Welcome"];
	if (self) {
	}
	
	return self;
}

- (IBAction) openSignin:(id)sender
{
	NSString* url = @"https://micro.blog/account";
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
}

@end
