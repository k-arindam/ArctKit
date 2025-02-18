//
//  ArctError.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// An enumeration representing possible errors in the Arct framework.
/// - Conforms to `Error` for error handling and `ArctEntity` for entity classification.
public enum ArctError: Error, ArctEntity {
    
    /// Error thrown when a requested dependency is not found.
    /// - Associated value: The key of the missing dependency.
    case dependencyNotFound(String)
    
    /// Error thrown when trying to register a dependency that already exists.
    /// - Associated value: The key of the already registered dependency.
    case dependencyAlreadyRegistered(String)
    
    /// Error indicating that a functionality is not yet implemented.
    case notImplemented
}

