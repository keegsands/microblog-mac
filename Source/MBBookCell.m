//
//  MBBookCell.m
//  Micro.blog
//
//  Created by Manton Reece on 5/19/22.
//  Copyright © 2022 Micro.blog. All rights reserved.
//

#import "MBBookCell.h"

#import "MBBook.h"

@implementation MBBookCell

- (void) setupWithBook:(MBBook *)book
{
	self.titleField.stringValue = book.title;
	
	if ([book.authors count] > 0) {
		self.authorField.stringValue = [book.authors firstObject];
	}
	else {
		self.authorField.stringValue = @"";
	}
	
	self.coverImageView.image = book.coverImage;
}

- (void) drawBackgroundInRect:(NSRect)dirtyRect
{
	CGRect r = self.bounds;
	[self.backgroundColor set];
	NSRectFill (r);
}

- (void) drawSelectionInRect:(NSRect)dirtyRect
{
	CGRect r = self.bounds;
	if ([self.superview isKindOfClass:[NSTableView class]]) {
		NSTableView* table = (NSTableView *)self.superview;
		if (![table.window isKeyWindow]) {
			[[NSColor colorNamed:@"color_row_unfocused_selection"] set];
		}
		else if (table.window.firstResponder == table) {
			[[NSColor selectedContentBackgroundColor] set];
		}
		else {
			[[NSColor colorNamed:@"color_row_unfocused_selection"] set];
		}
	}
	
	NSRectFill (r);
}

@end
