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

/**
 This header is private to the Twitter Core SDK and not exposed for public SDK consumption
 */

#import <Foundation/Foundation.h>

#pragma mark Twitter API
extern NSString *const TWTRTwitterDomain;
extern NSString *const TWTRTwitterXDomain;

#pragma mark - Authentication
extern NSString *const TWTRAuthDirectoryLegacyName;
extern NSString *const TWTRAuthDirectoryName;
extern NSString *const TWTRSDKScheme;
extern NSString *const TWTRSDKRedirectHost;

#pragma mark - Paths
extern NSString *const TWTRTwitterRequestTokenPath;
extern NSString *const TWTRTwitterAuthorizePath;
extern NSString *const TWTRTwitterAccessTokenPath;
extern NSString *const TWTRAppAuthTokenPath;
extern NSString *const TWTRGuestAuthTokenPath;

#pragma mark - OAuth strings
extern NSString *const TWTRAuthOAuthTokenKey;
extern NSString *const TWTRAuthOAuthSecretKey;
extern NSString *const TWTRAuthAppOAuthTokenKey;
extern NSString *const TWTRGuestAuthOAuthTokenKey;
extern NSString *const TWTRAuthAppOAuthUserIDKey;
extern NSString *const TWTRAuthAppOAuthScreenNameKey;
extern NSString *const TWTRAuthAppOAuthVerifierKey;
extern NSString *const TWTRAuthAppOAuthDeniedKey;
extern NSString *const TWTRAuthAppOAuthAppKey;
extern NSString *const TWTRAuthAppOAuthCallbackConfirmKey;
extern NSString *const TWTRAuthAppOAuthCallbackKey;
extern NSString *const TWTRAuthTokenTypeKey;
extern NSString *const TWTRAuthTokenKey;
extern NSString *const TWTRAuthSecretKey;
extern NSString *const TWTRAuthUsernameKey;
extern NSString *const TWTRAuthTokenSeparator;

#pragma mark - HTTP Headers
extern NSString *const TWTRAuthorizationHeaderField;
extern NSString *const TWTRGuestTokenHeaderField;

#pragma mark - Resources
extern NSString *const TWTRLoginButtonImageLocation;

#pragma mark - Errors
extern NSString *const TWTRMissingAccessTokenMsg;

typedef NS_ENUM(NSInteger, TWTRAuthType) { TWTRAuthTypeApp = 1, TWTRAuthTypeGuest = 2, TWTRAuthTypeUser = 3 };
