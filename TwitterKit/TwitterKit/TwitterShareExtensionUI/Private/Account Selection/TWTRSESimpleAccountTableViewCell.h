//
//  TWTRSESimpleAccountTableViewCell.h
//  TwitterKit
//
//  Created by Artem on 28.07.2023.
//  Copyright © 2023 Twitter. All rights reserved.
//

@import UIKit;

#import "TWTRSEBaseTableViewCell.h"

@protocol TWTRSEAccount;
@protocol TWTRSEImageDownloader;
@protocol TWTRSENetworking;
@protocol TWTRSETwitterUser;

NS_ASSUME_NONNULL_BEGIN

@interface TWTRSESimpleAccountTableViewCell : TWTRSEBaseTableViewCell

- (void)configureWithAccount:(id<TWTRSEAccount>)account isSelected:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END
