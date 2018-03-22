//
//  RFAccountCell.h
//  Snippets
//
//  Created by Manton Reece on 3/22/18.
//  Copyright © 2018 Riverfold Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class RFAccount;
@class RFRoundedImageView;

@interface RFAccountCell : NSCollectionViewItem

@property (strong, nonatomic) IBOutlet RFRoundedImageView* profileImageView;
@property (strong, nonatomic) IBOutlet NSImageView* arrowImageView;

- (void) setupWithAccount:(RFAccount *)account;

@end
