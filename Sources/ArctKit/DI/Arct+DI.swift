//
//  Arct+DI.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// Extends `ArctImpl` to conform to `ArctDI` and `ArctDIPlus`,
/// implementing dependency injection functionalities such as registering, finding, replacing, and removing dependencies.
extension ArctImpl: ArctDI, ArctDIPlus {
    
    /// Registers a new instance in the dependency container.
    /// - Parameters:
    ///   - instance: The instance to be stored, conforming to `ArctController`.
    ///   - key: A unique identifier for the instance.
    /// - Throws: `ArctError.dependencyAlreadyRegistered` if an instance with the same key already exists.
    /// - Returns: The registered instance.
    public func put<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController {
        let exists: Bool = self.isRegistered(key)
        
        if exists {
            throw ArctError.dependencyAlreadyRegistered(key)
        }
        
        self.dependencies[key] = instance
        return instance
    }
    
    /// Retrieves a registered instance from the dependency container.
    /// - Parameter key: The unique identifier of the instance.
    /// - Throws: `ArctError.dependencyNotFound` if the instance is not found.
    /// - Returns: The retrieved instance.
    public func find<T>(with key: String) throws(ArctError) -> T where T: ArctController {
        if let instance = self.dependencies[key] as? T {
            return instance
        }
        
        throw ArctError.dependencyNotFound(key)
    }
    
    /// Replaces an existing instance in the dependency container with a new one.
    /// - Parameters:
    ///   - instance: The new instance to store.
    ///   - key: The unique identifier for the instance.
    /// - Throws: `ArctError.dependencyNotFound` if no existing instance is found with the given key.
    /// - Returns: The replaced instance.
    public func replace<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController {
        let exists: Bool = self.isRegistered(key)
        
        if !exists {
            throw ArctError.dependencyNotFound(key)
        }
        
        self.dependencies[key] = instance
        return instance
    }
    
    /// Removes an instance from the dependency container.
    /// - Parameter key: The key of the instance to be removed.
    public func remove(for key: String) -> Void {
        self.dependencies.removeValue(forKey: key)
    }
    
    /// Checks whether an instance is registered under a given key.
    /// - Parameter key: The key to check.
    /// - Returns: `true` if an instance is registered, otherwise `false`.
    public func isRegistered(_ key: String) -> Bool {
        self.dependencies.keys.contains(where: { $0 == key })
    }
    
    /// Lazily registers an instance (currently not implemented).
    /// - Throws: `ArctError.notImplemented`.
    public func lazyPut<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController {
        throw .notImplemented
    }
    
    /// Retrieves an instance if it exists; otherwise, registers and returns the provided instance (currently not implemented).
    /// - Throws: `ArctError.notImplemented`.
    public func findOrPut<T>(_ instance: T, with key: String) throws(ArctError) -> T where T: ArctController {
        throw .notImplemented
    }
}
