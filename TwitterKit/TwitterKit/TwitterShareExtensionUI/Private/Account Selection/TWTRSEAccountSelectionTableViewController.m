/*
 * Copyright (C) 2017 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import "TWTRSEAccountSelectionTableViewController.h"
#import "TWTRSEAccount.h"
#import "TWTRSEAccountTableViewCell.h"
#import "TWTRSESimpleAccountTableViewCell.h"
#import "TWTRSELocalizedString.h"
#import "TWTRTwitter.h"
#import "TWTRComposerAccount.h"

#pragma mark -

@interface TWTRSEAccountSelectionTableViewController ()

@property (nonatomic, readonly, copy) NSArray<id<TWTRSEAccount>> *accounts;

@property (nonatomic) id<TWTRSEAccount> selectedAccount;
@property (nonatomic, readonly) id<TWTRSEImageDownloader> imageDownloader;
@property (nonatomic, readonly) id<TWTRSENetworking> networking;

@end

@implementation TWTRSEAccountSelectionTableViewController

- (instancetype)initWithAccounts:(NSArray<id<TWTRSEAccount>> *)accounts selectedAccount:(id<TWTRSEAccount>)selectedAccount imageDownloader:(id<TWTRSEImageDownloader>)imageDownloader networking:(nonnull id<TWTRSENetworking>)networking delegate:(nonnull id<TWTRSEAccountSelectionDelegate>)delegate
{
    NSParameterAssert(accounts);
    NSParameterAssert(accounts.count > 0);
    NSParameterAssert(selectedAccount);
    NSParameterAssert(imageDownloader);
    NSParameterAssert(networking);
    NSParameterAssert(delegate);

    if ((self = [super initWithStyle:UITableViewStylePlain])) {
        _accounts = [accounts copy];
        _selectedAccount = selectedAccount;
        _imageDownloader = imageDownloader;
        _networking = networking;
        _delegate = delegate;

        self.title = [TSELocalized localizedString:TSEUI_LOCALIZABLE_SHARE_EXT_ACCOUNT];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddAccount:)];
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[TWTRSESimpleAccountTableViewCell class] forCellReuseIdentifier:TWTRSEAccountTableViewCell.reuseIdentifier];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 48.0;
    self.tableView.estimatedRowHeight = 48.0;
}

- (void)setSelectedAccount:(id<TWTRSEAccount>)selectedAccount
{
    _selectedAccount = selectedAccount;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)actionAddAccount:(id)sender
{
    [[TWTRTwitter sharedInstance] webLogInWithViewController:self completion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        [self sessionDidConnect:session];
    }];
}

- (void)sessionDidConnect:(TWTRSession * _Nullable)session
{
    if (session == nil) {
        return;
    }
    
    TWTRComposerAccount *account = accountFromSession(session);
    if (account == nil) {
        return;
    }
    
    NSMutableArray<id<TWTRSEAccount>> *accountsModified = [self.accounts mutableCopy];
    [accountsModified addObject:account];
    _accounts = accountsModified;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.delegate accountSelectionTableViewController:self didAddAccount:account];
        
        self.selectedAccount = account;
        [self.delegate accountSelectionTableViewController:self didSelectAccount:self.selectedAccount];
        
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)self.accounts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TWTRSEAccount> account = self.accounts[(NSUInteger)indexPath.row];

    TWTRSESimpleAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TWTRSEAccountTableViewCell.reuseIdentifier forIndexPath:indexPath];

    [cell configureWithAccount:account isSelected:account == self.selectedAccount];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedAccount = self.accounts[(NSUInteger)indexPath.row];

    [self.delegate accountSelectionTableViewController:self didSelectAccount:self.selectedAccount];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        id<TWTRSEAccount> removedAccount = self.accounts[(NSUInteger)indexPath.row];
        
        NSString *userID = [NSString stringWithFormat:@"%@",@(removedAccount.userID)];
        [TWTRTwitter.sharedInstance.sessionStore logOutUserID:userID];
        
        NSMutableArray<id<TWTRSEAccount>> *accountsModified = [self.accounts mutableCopy];
        [accountsModified removeObject:removedAccount];
        _accounts = accountsModified;
        
        [self.delegate accountSelectionTableViewController:self didDeleteAccount:removedAccount];
        
        if (self.selectedAccount.userID == removedAccount.userID) {
            self.selectedAccount = [accountsModified firstObject];
            [self.delegate accountSelectionTableViewController:self didSelectAccount:self.selectedAccount];
        }
        
        [tableView reloadData];
    }
}

@end
