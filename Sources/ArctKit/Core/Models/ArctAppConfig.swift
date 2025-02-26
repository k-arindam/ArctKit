//
//  ArctAppConfig.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 25/02/25.
//

import Foundation
import SwiftUI

/// A configuration structure for setting up an `Arct`-powered application.
///
/// This struct defines the initial settings required for the app, including:
/// - The initial route.
/// - A closure to construct views based on routes.
/// - Optional initial bindings for dependency injection.
/// - An optional app group identifier for shared storage.
///
/// - Generics:
///   - `Child`: A SwiftUI `View` that represents the root view of a route.
///   - `Route`: A type representing possible navigation routes in the app.
public struct ArctAppConfig<Child, Route> {
    
    /// The optional app group identifier for shared `UserDefaults` access.
    ///
    /// If provided, `UserDefaults` will be initialized with this suite name to support shared storage.
    let appGroup: String?
    
    /// A dictionary of initial dependencies to be registered.
    ///
    /// - Keys are unique identifiers for the dependencies.
    /// - Values are instances conforming to `ArctController`.
    let initialBindings: [String: any ArctController]?
    
    /// The initial route that the application should navigate to on launch.
    let initialRoute: Route
    
    /// A closure that builds the corresponding view for a given route.
    ///
    /// - Parameter route: The navigation route.
    /// - Returns: A SwiftUI `View` associated with the given route.
    @ViewBuilder let routeBuilder: (Route) -> Child
    
    /// Initializes an `ArctAppConfig` instance with required application settings.
    ///
    /// - Parameters:
    ///   - appGroup: (Optional) An app group identifier for shared storage.
    ///   - initialBindings: (Optional) A dictionary of `ArctController` instances for dependency injection.
    ///   - initialRoute: The starting route for the app.
    ///   - routeBuilder: A closure that constructs a view based on the given route.
    public init(
        appGroup: String?,
        initialBindings: [String : any ArctController]?,
        initialRoute: Route,
        routeBuilder: @escaping (Route) -> Child
    ) {
        self.appGroup = appGroup
        self.initialBindings = initialBindings
        self.initialRoute = initialRoute
        self.routeBuilder = routeBuilder
    }
}
