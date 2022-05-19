//
//  MBBookCell.h
//  Micro.blog
//
//  Created by Manton Reece on 5/19/22.
//  Copyright © 2022 Micro.blog. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@class MBBook;

@interface MBBookCell : NSTableRowView

@property (strong, nonatomic) IBOutlet NSImageView* coverImageView;
@property (strong, nonatomic) IBOutlet NSTextField* titleField;
@property (strong, nonatomic) IBOutlet NSTextField* authorField;

- (void) setupWithBook:(MBBook *)book;

@end

NS_ASSUME_NONNULL_END
