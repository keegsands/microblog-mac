//
//  RFExportController.h
//  Micro.blog
//
//  Created by Manton Reece on 7/4/21.
//  Copyright © 2021 Micro.blog. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@class RFPost;

@interface RFExportController : NSWindowController

@property (strong, nonatomic) IBOutlet NSTextField* statusField;
@property (strong, nonatomic) IBOutlet NSTextField* secondaryField;
@property (strong, nonatomic) IBOutlet NSProgressIndicator* progressBar;
@property (strong, nonatomic) IBOutlet NSButton* cancelButton;

@property (strong) NSString* exportFolder;
@property (strong) NSMutableArray* queuedUploads;
@property (assign) NSInteger totalUploads;
@property (assign) BOOL isCancelled;

- (NSString *) writePost:(RFPost *)post;
- (NSString *) writePost:(RFPost *)post includeFrontmatter:(BOOL)includeFrontmatter;
- (NSString *) promptSave:(NSString *)defaultName;
- (void) finishExport;
- (void) cleanupExport;

@end

NS_ASSUME_NONNULL_END
