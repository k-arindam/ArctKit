// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

/// A singleton class implementing navigation and dependency management.
/// - Conforms to `ObservableObject` to allow SwiftUI views to react to changes.
/// - Uses `@unchecked Sendable` to indicate manual thread safety considerations.
public final class ArctImpl: NSObject, ObservableObject, @unchecked Sendable {
    
    /// Private initializer to enforce singleton pattern.
    private override init() { super.init() }
    
    /// Shared instance of `ArctImpl`, ensuring a single instance is used across the app.
    internal static let shared: ArctImpl = ArctImpl()
    
    // MARK: - Immutable Members
    // (Add immutable properties here if needed in future)

    // MARK: - Listenable Members (Mutable)

    /// Stack maintaining the navigation history.
    @Published var routeStack: NavigationPath = NavigationPath()
    
    /// Stores the initial route of the navigation flow.
    @Published var initialRoute: (any ArctRoute)? = nil

    // MARK: - Mutable Members
    
    /// Dictionary storing dependencies, where keys are string identifiers
    /// and values conform to `ArctController` protocol.
    internal var dependencies: [String: any ArctController] = [:]
}

/// Global access point to the singleton instance of `ArctImpl`.
public let Arct = ArctImpl.shared
