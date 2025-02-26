//
//  ArctApp.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI

/// A generic struct representing an `Arct` application.
///
/// This struct acts as the entry point for an `Arct`-powered app, configuring its routing and dependencies
/// based on the provided `ArctAppConfig`.
///
/// - Conforms to:
///   - `ArctAppView`: Defines the necessary structure for an `Arct`-based application.
/// - Generics:
///   - `Child`: A SwiftUI `View` that represents the main UI for each route.
///   - `Route`: A type conforming to `ArctRoute`, representing possible navigation paths in the app.
public struct ArctApp<Child, Route>: ArctAppView where Child: View, Route: ArctRoute {
    /// The configuration settings for the application.
    let config: ArctAppConfig<Child, Route>
    
    /// Observed instance of `Arct` (singleton), used for managing the route stack.
    @ObservedObject var arct = Arct
    
    /// Initializes an `ArctApp` with the provided configuration.
    ///
    /// - Parameter config: An instance of `ArctAppConfig` that defines the application's routing, dependencies, and storage settings.
    public init(config: ArctAppConfig<Child, Route>) { self.config = config }
    
    /// The body of the `ArctApp` view, which contains the navigation stack and route handling logic.
    public var body: some View {
        NavigationStack(path: $arct.routeStack) {
            Group {
                // Display the initial route or a fallback message if no initial route is set.
                if let root = arct.initialRoute as? Route {
                    config.routeBuilder(root)
                } else {
                    Text("No initial route set!")
                }
            }
            // Define navigation destinations for `Route` types, using the provided `routeBuilder` closure.
            .navigationDestination(for: Route.self, destination: config.routeBuilder)
        }
        // Set up ARCT on view appearance (e.g., initialize route and bindings).
        .onAppear { arct.configure(with: config) }
    }
}
