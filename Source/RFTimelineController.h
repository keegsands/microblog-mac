//
//  RFTimelineController.h
//  Snippets for Mac
//
//  Created by Manton Reece on 9/21/15.
//  Copyright © 2015 Riverfold Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@class RFPostController;
@class RFRoundedImageView;

typedef enum {
	kSelectionTimeline = 0,
	kSelectionMentions = 1,
	kSelectionFavorites = 2
} RFSelectedTimelineType;

@interface RFTimelineController : NSWindowController <NSSplitViewDelegate, NSTableViewDelegate, NSTableViewDataSource>

@property (strong, nonatomic) IBOutlet NSTableView* tableView;
@property (strong, nonatomic) IBOutlet NSSplitView* splitView;
@property (strong, nonatomic) IBOutlet WebView* webView;
@property (strong, nonatomic) IBOutlet NSTextField* fullNameField;
@property (strong, nonatomic) IBOutlet NSTextField* usernameField;
@property (strong, nonatomic) IBOutlet RFRoundedImageView* profileImageView;

@property (strong, nonatomic) NSPopover* optionsPopover;
@property (strong, nonatomic) RFPostController* postController;
@property (assign, nonatomic) RFSelectedTimelineType selectedTimeline;

- (IBAction) performClose:(id)sender;

- (void) showReplyWithPostID:(NSString *)postID username:(NSString *)username;
- (void) showOptionsMenuWithPostID:(NSString *)postID;
- (void) setSelected:(BOOL)isSelected withPostID:(NSString *)postID;

@end
