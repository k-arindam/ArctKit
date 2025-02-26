//
//  ArctImpl.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 25/02/25.
//

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
    
    /// Indicates whether the `Arct` framework has been configured.
    ///
    /// - This property is `@Published`, meaning it can be observed in SwiftUI or Combine-based workflows.
    /// - Once set to `true`, the framework prevents reconfiguration to maintain consistency.
    @Published internal var appConfigured: Bool = false

    /// Stack maintaining the navigation history.
    @Published internal var routeStack: NavigationPath = NavigationPath()
    
    /// Stores the initial route of the navigation flow.
    @Published internal var initialRoute: (any ArctRoute)? = nil

    // MARK: - Mutable Members
    
    /// Dictionary storing dependencies, where keys are string identifiers
    /// and values conform to `ArctController` protocol.
    internal var dependencies: [String: any ArctController] = [:]
    
    /// Stores a reference to `UserDefaults` for persistent data storage.
    ///
    /// - If an app group is provided during configuration, this will be initialized with a shared `UserDefaults` suite.
    /// - Otherwise, it defaults to `UserDefaults.standard`.
    internal var userDefaults: UserDefaults? = nil
    
    // MARK: - Internal & Private Methods
    
    /// Configures the `Arct` framework with the provided application settings.
    ///
    /// This function ensures that the framework is only configured once per application lifecycle.
    /// It registers initial dependencies, sets the initial route, and configures `UserDefaults` based on the provided app group.
    ///
    /// - Parameters:
    ///   - config: An instance of `ArctAppConfig` that contains configuration details, including:
    ///     - Initial dependency bindings.
    ///     - The initial route.
    ///     - An optional app group identifier for shared storage.
    /// - Generics:
    ///   - `C`: A SwiftUI `View` representing the root content.
    ///   - `R`: A type conforming to `ArctRoute`, representing application navigation.
    /// - Note: If `appConfigured` is already `true`, the function exits early to prevent reconfiguration.
    internal func configure<C, R>(with config: ArctAppConfig<C, R>) -> Void where C: View, R: ArctRoute {
        // Ensure the app is configured only once.
        guard !appConfigured else { return }
        self.appConfigured = true

        do {
            // If initial bindings are provided, attempt to register them in `Arct`.
            if let bindings = config.initialBindings {
                for (key, instance) in bindings {
                    _ = try self.put(instance, with: key) // Register each dependency.
                }
            }
        } catch {
            // Log any errors that occur during dependency registration.
            debugPrint("----->>> \(error)")
        }

        // Set the application's initial route.
        self.initialRoute = config.initialRoute

        // Configure `UserDefaults` based on the provided app group.
        if let appGroup = config.appGroup {
            self.userDefaults = UserDefaults(suiteName: appGroup) // Use shared storage.
        } else {
            self.userDefaults = .standard // Default to the standard UserDefaults.
        }
    }

}
