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
 This header is private to the Twitter Kit SDK and not exposed for public SDK consumption
 */

//  Intentionally separating these out from `TWTRAPIConstants` so we can be immune to changes
//  in the values of the API response. Changing any of these values can be a breaking change
//  for the TwitterKit customers who had stored the model objects we return because they
//  conform to `NSCoding` protocol.

#import <Foundation/Foundation.h>

extern NSString *const TWTRTweetCodingFieldCreatedAt;
extern NSString *const TWTRTweetCodingFieldCurrentUserRetweet;
extern NSString *const TWTRTweetCodingFieldEntitiesHashtags;
extern NSString *const TWTRTweetCodingFieldEntitiesMedia;
extern NSString *const TWTRTweetCodingFieldEntitiesUrls;
extern NSString *const TWTRTweetCodingFieldEntitiesUserMentions;
extern NSString *const TWTRTweetCodingFieldLikeCount;
extern NSString *const TWTRTweetCodingFieldLiked;
extern NSString *const TWTRTweetCodingFieldID;
extern NSString *const TWTRTweetCodingFieldInReplyToScreenName;
extern NSString *const TWTRTweetCodingFieldInReplyToStatusID;
extern NSString *const TWTRTweetCodingFieldInReplyToUserID;
extern NSString *const TWTRTweetCodingFieldRetweetCount;
extern NSString *const TWTRTweetCodingFieldRetweeted;
extern NSString *const TWTRTweetCodingFieldRetweetedTweet;
extern NSString *const TWTRTweetCodingFieldText;
extern NSString *const TWTRTweetCodingFieldUser;
