//
//  TWTRSESimpleAccountTableViewCell.m
//  TwitterKit
//
//  Created by Artem on 28.07.2023.
//  Copyright © 2023 Twitter. All rights reserved.
//

#import "TWTRSESimpleAccountTableViewCell.h"
#import "TWTRImages.h"
#import "TWTRSEAccount.h"
#import "TWTRSEColors.h"
#import "TWTRSEFonts.h"
#import "TWTRSEImageDownloader.h"
#import "TWTRSENetworking.h"
#import "TWTRSETwitterUser.h"
#import "TWTRSEUIBundle.h"
#import "UIView+TSEExtensions.h"
#import "TWTRColorUtil.h"

@interface TWTRSESimpleAccountTableViewCell ()

@end

@implementation TWTRSESimpleAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [TWTRSEFonts userUsernameFont];
        self.textLabel.textColor = [TWTRSEFonts userUsernameColor];
        
        UIView *selectedBackgroundView = [UIView new];
        selectedBackgroundView.backgroundColor = [TWTRColorUtil selectedCellBackgroundColor];
        self.selectedBackgroundView = selectedBackgroundView;
        
        UIView *backgroundView = [UIView new];
        backgroundView.backgroundColor = [UIColor whiteColor];
        self.backgroundView = backgroundView;
    }

    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.textLabel.text = nil;
    self.accessoryType = UITableViewCellAccessoryNone;
}

#pragma mark - Public

- (void)configureWithAccount:(id<TWTRSEAccount>)account isSelected:(BOOL)isSelected
{
    NSParameterAssert(account);
    
    self.textLabel.text = TWTRSEAccountDisplayUsername(account);
    self.accessoryType = isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
