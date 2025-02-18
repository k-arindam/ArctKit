//
//  ArctApp.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI

/// A struct representing an Arct application view, managing the navigation and route system.
/// - `Child` is the view type that will be rendered as part of the route.
/// - `Route` is the type of route used in navigation, conforming to `ArctRoute`.
public struct ArctApp<Child, Route>: ArctAppView where Child: View, Route: ArctRoute {
    
    /// A dictionary of initial bindings, mapping string keys to instances of `ArctController`.
    let initialBindings: [String: any ArctController]?
    
    /// A closure that takes a `Route` and returns a `Child` view for the route.
    @ViewBuilder let routeBuilder: (Route) -> Child
    
    /// The initial route to be set when the view appears.
    let initialRoute: Route
    
    /// Observed instance of `Arct` (singleton), used for managing the route stack.
    @ObservedObject var arct = Arct
    
    /// Initializer for `ArctApp`, which sets up the route builder, initial route, and optional initial bindings.
    /// - Parameters:
    ///   - routeBuilder: A closure to build views based on the route.
    ///   - initialRoute: The initial route to set when the app view appears.
    ///   - initialBindings: Optional dictionary of initial bindings for `ArctController` instances.
    public init(@ViewBuilder routeBuilder: @escaping (Route) -> Child, initialRoute: Route, initialBindings: [String: any ArctController]? = nil) {
        self.routeBuilder = routeBuilder
        self.initialRoute = initialRoute
        self.initialBindings = initialBindings
    }
    
    /// The body of the `ArctApp` view, which contains the navigation stack and route handling logic.
    public var body: some View {
        NavigationStack(path: $arct.routeStack) {
            Group {
                // Display the initial route or a fallback message if no initial route is set.
                if let root = arct.initialRoute as? Route {
                    routeBuilder(root)
                } else {
                    Text("No initial route set!")
                }
            }
            // Define navigation destinations for `Route` types, using the provided `routeBuilder` closure.
            .navigationDestination(for: Route.self, destination: routeBuilder)
        }
        // Set up ARCT on view appearance (e.g., initialize route and bindings).
        .onAppear(perform: setupARCT)
    }
    
    /// A helper function that sets up the initial route and bindings for the `Arct` instance.
    private func setupARCT() -> Void {
        // Set the initial route when the app view appears.
        arct.initialRoute = self.initialRoute
        
        do {
            // If initial bindings are provided, attempt to register them in `Arct`.
            if let initialBindings {
                for (key, instance) in initialBindings {
                    _ = try arct.put(instance, with: key)
                }
            }
            
        } catch {
            // Print any errors that occur during setup.
            debugPrint("----->>> \(error)")
        }
    }
}
