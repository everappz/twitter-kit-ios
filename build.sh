#!/bin/bash

set -e

# Variables
FRAMEWORK_NAME="TwitterKit"
OUTPUT_DIR="./output"
IOS_ARCHIVE_PATH="./build/ios"
SIMULATOR_ARCHIVE_PATH="./build/simulator"
CATALYST_ARCHIVE_PATH="./build/catalyst"
XCFRAMEWORK_PATH="./${FRAMEWORK_NAME}.xcframework"

# Clean up any previous builds
rm -rf "$OUTPUT_DIR" "$XCFRAMEWORK_PATH"
mkdir -p "$OUTPUT_DIR"

# Build for iOS device (armv7, arm64) - iOS 12.0+
xcodebuild archive \
    -project TwitterKit/TwitterKit.xcodeproj \
    -scheme $FRAMEWORK_NAME \
    -sdk iphoneos \
    -archivePath "${IOS_ARCHIVE_PATH}" \
    -configuration Debug \
    -destination 'generic/platform=iOS' \
    -derivedDataPath ./build \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SUPPORTS_MACCATALYST=NO

# Build for iOS Simulator (x86_64, arm64) - iOS 12.0+
xcodebuild archive \
    -project TwitterKit/TwitterKit.xcodeproj \
    -scheme $FRAMEWORK_NAME \
    -sdk iphonesimulator \
    -archivePath "${SIMULATOR_ARCHIVE_PATH}" \
    -configuration Debug \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath ./build \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SUPPORTS_MACCATALYST=NO

# Build for Mac Catalyst (x86_64, arm64) - iOS 13.0+
xcodebuild archive \
    -project TwitterKit/TwitterKit.xcodeproj \
    -scheme $FRAMEWORK_NAME \
    -sdk macosx \
    -archivePath "${CATALYST_ARCHIVE_PATH}" \
    -configuration Debug \
    -destination 'generic/platform=macOS,variant=Mac Catalyst' \
    -derivedDataPath ./build \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SUPPORTS_MACCATALYST=YES

# Create XCFramework
xcodebuild -create-xcframework \
    -framework "${IOS_ARCHIVE_PATH}.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "${SIMULATOR_ARCHIVE_PATH}.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "${CATALYST_ARCHIVE_PATH}.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "$XCFRAMEWORK_PATH"

# Zip the XCFramework
ZIP_FILE="${FRAMEWORK_NAME}.xcframework.zip"
if test -f "$ZIP_FILE"; then
    rm "$ZIP_FILE"
fi
zip -r "$ZIP_FILE" "$XCFRAMEWORK_PATH"