//
//  ArctNavigation.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// A protocol defining navigation-related functionalities.
/// Conforming types should handle pushing, replacing, and popping routes.
internal protocol ArctNavigation {
    
    /// Pushes a new route onto the navigation stack.
    /// - Parameter _: A route conforming to `ArctRoute`.
    func push<T>(_: T) -> Void where T: ArctRoute
    
    /// Replaces the current route with a new one in the navigation stack.
    /// - Parameter _: A route conforming to `ArctRoute`.
    func pushReplacement<T>(_: T) -> Void where T: ArctRoute
    
    /// Pops the topmost route from the navigation stack.
    func pop() -> Void
    
    /// Pops all routes and navigates back to the root.
    func popToRoot() -> Void
    
    /// Replaces the root of the navigation stack with a new route.
    /// - Parameter route: The new root route conforming to `ArctRoute`.
    func replaceRoot<T>(with route: T) -> Void where T: ArctRoute
}
