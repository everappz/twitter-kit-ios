#!/bin/bash

set -e

## Build TwitterKit.framework - x86_64
xcodebuild \
    -project TwitterCore/TwitterCore.xcodeproj \
    -scheme TwitterCore -configuration Debug \
    -sdk "iphonesimulator" \
    HEADER_SEARCH_PATHS="$(pwd)/TwitterCore/iphonesimulator/Headers $(pwd)/TwitterCore/iphonesimulator/PrivateHeaders"  \
    CONFIGURATION_BUILD_DIR=./iphonesimulator \
	ENABLE_BITCODE=NO \
    clean build

## From: https://developer.apple.com/library/archive/qa/qa1940/_index.html
# If code signing fails with the error "resource fork, Finder information, or similar detritus not allowed."
#   e.g. /usr/bin/codesign --force --sign - --timestamp=none $(pwd)/TwitterCore/iphonesimulator/TwitterCore.framework
# Try:
#   xattr -lr /Users/SWARM5/Work/twitter-kit-ios-master/TwitterKit/iphonesimulator/TwitterKit.framework
#   xattr -cr /Users/SWARM5/Work/twitter-kit-ios-master/TwitterKit/iphonesimulator/TwitterKit.framework

## Build TwitterKit.framework - armv7, arm64
xcodebuild \
    -project TwitterCore/TwitterCore.xcodeproj \
    -scheme TwitterCore -configuration Debug \
    -sdk "iphoneos" \
    HEADER_SEARCH_PATHS="$(pwd)/TwitterCore/iphoneos/Headers $(pwd)/TwitterCore/iphoneos/PrivateHeaders"  \
    CONFIGURATION_BUILD_DIR=./iphoneos \
	ENABLE_BITCODE=NO \
    clean build

## Merge into one TwitterCore.framework with x86_64, armv7, arm64
rm -rf iOS
mkdir -p iOS
cp -r TwitterCore/iphoneos/TwitterCore.framework/ iOS/TwitterCore.framework
lipo -create -output iOS/TwitterCore.framework/TwitterCore TwitterCore/iphoneos/TwitterCore.framework/TwitterCore TwitterCore/iphonesimulator/TwitterCore.framework/TwitterCore
lipo -archs iOS/TwitterCore.framework/TwitterCore

## Zip them into TwitterKit.zip
ZIP_FILE=TwitterCore.zip
if test -f "$ZIP_FILE"; then
    rm "$ZIP_FILE"
fi
zip -r "$ZIP_FILE" iOS/*
rm -rf iOS
