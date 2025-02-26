//
//  ArctDI.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// A dependency injection (DI) protocol for managing instances of `ArctController`.
/// Provides methods for storing, retrieving, replacing, and removing dependencies.
internal protocol ArctDI {
    
    /// Registers an instance with a unique key.
    /// - Parameters:
    ///   - instance: The instance to be stored, conforming to `ArctController`.
    ///   - key: A unique identifier for the instance.
    /// - Throws: `ArctError` if registration fails.
    /// - Returns: The registered instance.
    func put<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController
    
    /// Retrieves a registered instance by its key.
    /// - Parameter key: The unique identifier of the instance.
    /// - Throws: `ArctError` if the instance is not found.
    /// - Returns: The retrieved instance.
    func find<T>(with key: String) throws(ArctError) -> T where T: ArctController
    
    /// Replaces an existing instance with a new one.
    /// - Parameters:
    ///   - instance: The new instance to store.
    ///   - key: The unique identifier for the instance.
    /// - Throws: `ArctError` if replacement fails.
    /// - Returns: The replaced instance.
    func replace<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController
    
    /// Removes an instance associated with a given key.
    /// - Parameter key: The key of the instance to be removed.
    func remove(for key: String) throws(ArctError) -> Void
    
    /// Checks if an instance is registered for a given key.
    /// - Parameter key: The key to check.
    /// - Returns: `true` if an instance is registered, otherwise `false`.
    func isRegistered(_ key: String) throws(ArctError) -> Bool
}

/// An extended dependency injection protocol with additional lazy-loading capabilities.
internal protocol ArctDIPlus {
    
    /// Registers an instance only when it is first accessed.
    /// - Parameters:
    ///   - instance: The instance to be lazily registered.
    ///   - key: A unique identifier for the instance.
    /// - Throws: `ArctError` if registration fails.
    /// - Returns: The registered instance.
    func lazyPut<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController
    
    /// Retrieves an instance if it exists; otherwise, registers and returns the provided instance.
    /// - Parameters:
    ///   - instance: The instance to register if not already present.
    ///   - key: The unique identifier for the instance.
    /// - Throws: `ArctError` if registration or retrieval fails.
    /// - Returns: The found or newly registered instance.
    func findOrPut<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController
}
