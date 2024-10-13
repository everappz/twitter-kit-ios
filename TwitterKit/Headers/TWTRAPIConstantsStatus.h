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

#import <Foundation/Foundation.h>

extern NSString *const TWTRAPIConstantsStatusShowURL;
extern NSString *const TWTRAPIConstantsStatusLookUpURL;
extern NSString *const TWTRAPIConstantsStatusUpdateURL;
extern NSString *const TWTRAPIConstantsStatusFavoriteURL;
extern NSString *const TWTRAPIConstantsStatusUnfavoriteURL;
extern NSString *const TWTRAPIConstantsStatusRetweetURLWithFormat;
extern NSString *const TWTRAPIConstantsStatusDestroyURLWithFormat;

// parameters
extern NSString *const TWTRAPIConstantsStatusParamStatus;
extern NSString *const TWTRAPIConstantsStatusParamTrimUser;
extern NSString *const TWTRAPIConstantsStatusParamIncludeMyRetweet;
extern NSString *const TWTRAPIConstantsStatusParamIncludeEntities;
extern NSString *const TWTRAPIConstantsStatusParamMap;

// Response field names
extern NSString *const TWTRAPIConstantsStatusFieldName;
extern NSString *const TWTRAPIConstantsStatusFieldCreatedAt;
extern NSString *const TWTRAPIConstantsStatusFieldDescription;
extern NSString *const TWTRAPIConstantsStatusFieldUsername;
extern NSString *const TWTRAPIConstantsStatusFieldLocation;
extern NSString *const TWTRAPIConstantsStatusFieldPlace;
extern NSString *const TWTRAPIConstantsStatusFieldFollowersCount;
extern NSString *const TWTRAPIConstantsStatusFieldFriendsCount;
extern NSString *const TWTRAPIConstantsStatusFieldStatusesCount;
extern NSString *const TWTRAPIConstantsStatusFieldFavoritesCount;

extern NSString *const TWTRAPIConstantsStatusFieldMode;
extern NSString *const TWTRAPIConstantsStatusFieldQuery;
extern NSString *const TWTRAPIConstantsStatusFieldProfileImageUrl;
extern NSString *const TWTRAPIConstantsStatusFieldProfileHeaderUrl;
extern NSString *const TWTRAPIConstantsStatusFieldInReplyToUserIDString;
extern NSString *const TWTRAPIConstantsStatusFieldInReplyToScreenName;
extern NSString *const TWTRAPIConstantsStatusFieldInReplyToStatusIDString;
extern NSString *const TWTRAPIConstantsStatusFieldRetweetCount;
extern NSString *const TWTRAPIConstantsStatusFieldRetweetedStatus;
extern NSString *const TWTRAPIConstantsStatusFieldQuotedStatus;
extern NSString *const TWTRAPIConstantsStatusFieldFavoriteCount;
extern NSString *const TWTRAPIConstantsStatusFieldReplyCount;
extern NSString *const TWTRAPIConstantsStatusFieldViewCount;
extern NSString *const TWTRAPIConstantsStatusFieldDescendentReplyCount;
extern NSString *const TWTRAPIConstantsStatusFieldText;
extern NSString *const TWTRAPIConstantsStatusFieldFullText;
extern NSString *const TWTRAPIConstantsStatusFieldFavorited;
extern NSString *const TWTRAPIConstantsStatusFieldRetweeted;
extern NSString *const TWTRAPIConstantsStatusFieldSuspended;
extern NSString *const TWTRAPIConstantsStatusFieldProtected;
extern NSString *const TWTRAPIConstantsStatusFieldVerified;
extern NSString *const TWTRAPIConstantsStatusFieldIsLifelineInstitution;
extern NSString *const TWTRAPIConstantsStatusFieldGeoEnabled;
extern NSString *const TWTRAPIConstantsStatusFieldCoordinates;
extern NSString *const TWTRAPIConstantsStatusFieldUser;
extern NSString *const TWTRAPIConstantsStatusFieldFollowing;
extern NSString *const TWTRAPIConstantsStatusFieldFollowedBy;
extern NSString *const TWTRAPIConstantsStatusFieldBlocking;
extern NSString *const TWTRAPIConstantsStatusFieldCanDM;
extern NSString *const TWTRAPIConstantsStatusFieldWantRetweets;
extern NSString *const TWTRAPIConstantsStatusFieldLifelineFollowing;

extern NSString *const TWTRAPIConstantsStatusFieldMetadata;
extern NSString *const TWTRAPIConstantsStatusFieldPromotedContent;
extern NSString *const TWTRAPIConstantsStatusFieldSampleUsers;
extern NSString *const TWTRAPIConstantsStatusFieldCurrentUserRetweet;
extern NSString *const TWTRAPIConstantsStatusFieldTitle;
extern NSString *const TWTRAPIConstantsStatusFieldScreenName;
extern NSString *const TWTRAPIConstantsStatusFieldCardClassic;
extern NSString *const TWTRAPIConstantsStatusFieldCardCurrent;
extern NSString *const TWTRAPIConstantsStatusFieldVersion;
extern NSString *const TWTRAPIConstantsStatusFieldWoeID;
extern NSString *const TWTRAPIConstantsStatusFieldCountry;
extern NSString *const TWTRAPIConstantsStatusFieldCountryCode;
extern NSString *const TWTRAPIConstantsStatusFieldPossiblySensitive;
extern NSString *const TWTRAPIConstantsStatusFieldIsEmergency;
extern NSString *const TWTRAPIConstantsStatusFieldConfig;
extern NSString *const TWTRAPIConstantsStatusFieldValue;
extern NSString *const TWTRAPIConstantsStatusFieldLang;
extern NSString *const TWTRAPIConstantsStatusFieldTranslatedLang;

// Entity names
extern NSString *const TWTRAPIConstantsStatusFieldEntities;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesUrls;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesHashtags;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesCashTags;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesUserMentions;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesMedia;
extern NSString *const TWTRAPIConstantsStatusFieldEntitiesExtended;

extern NSString *const TWTRAPIConstantsStatusFieldIndices;
extern NSInteger const TWTRAPIConstantsStatusIndexDisplayStart;
extern NSInteger const TWTRAPIConstantsStatusIndexDisplayEnd;

// Url Entity names
extern NSString *const TWTRAPIConstantsStatusFieldUrlEntitiyUrl;
extern NSString *const TWTRAPIConstantsStatusFieldUrlEntityExpandedUrl;
extern NSString *const TWTRAPIConstantsStatusFieldUrlEntityDisplayUrl;

// Hashtag Entity names
extern NSString *const TWTRAPIConstantsStatusFieldHashtagEntityText;

// Cashtag Entity names
extern NSString *const TWTRAPIConstantsStatusFieldCashtagEntityText;

// Media Entity names
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityMediaID;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityMediaUrl;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityMediaUrlHttps;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityType;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntitySizes;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityMedium;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityWidth;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityHeight;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityVideoInfo;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityEmbeddable;
extern NSString *const TWTRAPIConstantsStatusFieldMediaEntityAdditionalMediaInfo;

// User Mention Entity Names
extern NSString *const TWTRAPIConstantsStatusFieldUserMentionEntityUserID;
extern NSString *const TWTRAPIConstantsStatusFieldUserMentionEntityName;
extern NSString *const TWTRAPIConstantsStatusFieldUserMentionEntityScreenName;
