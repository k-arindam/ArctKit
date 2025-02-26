//
//  ArctError.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// An enumeration representing possible errors in the Arct framework.
///
/// This enum covers various error cases that might occur within the framework,
/// such as missing dependencies, duplicate registrations, and unimplemented features.
///
/// - Conforms to:
///   - `Error`: Enables throwing and catching these errors.
///   - `ArctEntity`: Allows classification within the Arct framework.
public enum ArctError: Error, ArctEntity {
    
    /// Error thrown when a requested dependency is not found.
    ///
    /// This occurs when a dependency lookup fails because it hasn't been registered.
    /// - Associated Value: The key of the missing dependency, helping to identify the issue.
    case dependencyNotFound(String)
    
    /// Error thrown when trying to register a dependency that already exists.
    ///
    /// This prevents duplicate registrations, ensuring that each dependency key
    /// maps to a unique instance.
    /// - Associated Value: The key of the already registered dependency.
    case dependencyAlreadyRegistered(String)
    
    /// Error indicating that a functionality is not yet implemented.
    ///
    /// This case can be used as a placeholder for features that are planned but not yet available.
    case notImplemented
    
    /// Error thrown when the Arct framework is not properly configured.
    ///
    /// This ensures that necessary setup steps have been completed before using the framework.
    case arctappNotConfigured
}

