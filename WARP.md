# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

ArenaFit is an iOS app built with SwiftUI and SwiftData, targeting modern iOS development practices. The app uses SwiftData for data persistence and follows standard SwiftUI architectural patterns with support for cross-platform development (iOS/macOS).

## Development Commands

### Building and Running
```bash
# Open project in Xcode
open ArenaFit.xcodeproj

# Build from command line (requires xcodebuild)
xcodebuild -project ArenaFit.xcodeproj -scheme ArenaFit -configuration Debug build

# Build for simulator
xcodebuild -project ArenaFit.xcodeproj -scheme ArenaFit -sdk iphonesimulator -configuration Debug build

# Build for device
xcodebuild -project ArenaFit.xcodeproj -scheme ArenaFit -sdk iphoneos -configuration Release build
```

### Testing
```bash
# Run all tests
xcodebuild test -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15'

# Run only unit tests
xcodebuild test -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ArenaFitTests

# Run only UI tests
xcodebuild test -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ArenaFitUITests

# Run a specific test method
xcodebuild test -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ArenaFitTests/ArenaFitTests/example

# Run specific UI test
xcodebuild test -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ArenaFitUITests/ArenaFitUITests/testExample
```

### Development Workflow
```bash
# Clean build folder
xcodebuild -project ArenaFit.xcodeproj -scheme ArenaFit clean

# Archive for distribution
xcodebuild archive -project ArenaFit.xcodeproj -scheme ArenaFit -archivePath ArenaFit.xcarchive

# List available simulators
xcrun simctl list devices available

# Build and run on specific simulator
xcodebuild -project ArenaFit.xcodeproj -scheme ArenaFit -destination 'platform=iOS Simulator,name=iPhone 15' build
```

## Code Architecture

### Project Structure
```
ArenaFit/
├── ArenaFit.xcodeproj/       # Xcode project file
├── ArenaFit/                 # Main app source code
│   ├── ArenaFitApp.swift     # App entry point with SwiftData container
│   ├── ContentView.swift     # Main content view with navigation
│   ├── Item.swift            # SwiftData model
│   ├── Assets.xcassets/      # App resources and images
│   └── ArenaFit.entitlements # App entitlements
├── ArenaFitTests/            # Unit tests (Swift Testing framework)
└── ArenaFitUITests/          # UI tests (XCTest framework)
```

### Key Components

**App Architecture:**
- **SwiftUI App Pattern**: Uses `@main` struct conforming to `App` protocol
- **SwiftData Integration**: Configured with shared `ModelContainer` for data persistence
- **Navigation**: Uses `NavigationSplitView` for adaptive UI across devices
- **Cross-platform Support**: Conditional compilation (`#if os(macOS)`, `#if os(iOS)`) for platform-specific UI

**Data Layer:**
- **SwiftData Models**: `@Model` classes for data persistence (e.g., `Item.swift`)
- **Model Context**: Environment-based data context injection via `@Environment(\.modelContext)`
- **Query**: `@Query` property wrapper for reactive data fetching
- **Schema Definition**: Explicitly defined schema in `ArenaFitApp.swift`

**UI Patterns:**
- **Environment Values**: Uses SwiftUI environment system for dependency injection
- **Navigation Links**: Programmatic navigation within split view architecture
- **Animation**: Uses `withAnimation` blocks for smooth UI transitions
- **SwiftUI Previews**: Preview providers with in-memory model containers for development

**Testing Architecture:**
- **Unit Tests**: Uses new Swift Testing framework (`import Testing`) with `@Test` attribute
- **UI Tests**: Traditional XCTest framework (`XCUIApplication`) for UI automation
- **Test Isolation**: Separate test targets with independent configurations

### Development Practices
- SwiftUI lifecycle and state management patterns
- SwiftData as modern replacement for Core Data
- Platform-conditional UI code for iOS/macOS compatibility
- Modern Swift Testing framework alongside traditional XCTest
- Preview-driven development with in-memory data containers
