//
//  Arct+Navigation.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// Extends `ArctImpl` to conform to `ArctNavigation`,
/// implementing navigation functionalities like push, pop, and replace.
extension ArctImpl: ArctNavigation {
    
    /// Pushes a new route onto the navigation stack asynchronously.
    /// - Parameter route: The route to be added, conforming to `ArctRoute`.
    public func push<T>(_ route: T) -> Void where T: ArctRoute {
        DispatchQueue.main.async {
            self.routeStack.append(route)
        }
    }
    
    /// Replaces the current route with a new one.
    /// - Parameter route: The new route to be added, conforming to `ArctRoute`.
    public func pushReplacement<T>(_ route: T) -> Void where T: ArctRoute {
        pop(count: 1) {  // Remove the last route before appending the new one
            self.routeStack.append(route)
        }
    }
    
    /// Pops a specified number of routes from the navigation stack.
    /// - Parameters:
    ///   - count: The number of routes to remove.
    ///   - completion: An optional completion handler executed after popping.
    private func pop(count: Int, completion: (@Sendable () -> Void)? = nil) -> Void {
        DispatchQueue.main.async {
            if !self.routeStack.isEmpty {
                self.routeStack.removeLast(count) // Remove the specified number of routes
            }
            
            completion?() // Execute the completion handler if provided
        }
    }
    
    /// Pops the topmost route from the navigation stack.
    public func pop() -> Void { pop(count: 1) }
    
    /// Pops all routes and navigates back to the root.
    public func popToRoot() -> Void { pop(count: self.routeStack.count) }
    
    /// Replaces the root of the navigation stack with a new route.
    /// - Parameter route: The new root route, conforming to `ArctRoute`.
    public func replaceRoot<T>(with route: T) -> Void where T: ArctRoute {
        DispatchQueue.main.async {
            self.initialRoute = route
        }
    }
}
