//
//  Arct+Storage.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

/// Extends `ArctImpl` to conform to the `ArctStorage` protocol, providing
/// a `UserDefaults`-based implementation for storing, retrieving, and deleting data.
extension ArctImpl: ArctStorage {
    
    /// Stores a `Codable` value in `UserDefaults` under the given key.
    ///
    /// - Parameters:
    ///   - value: The `Codable` object to be stored.
    ///   - key: The unique key under which the value should be stored.
    /// - Throws: `ArctError.arctappNotConfigured` if `UserDefaults` is not set up.
    public func write<T>(_ value: T, for key: String) throws(ArctError) -> Void where T: Codable {
        guard let userDefaults else {
            throw .arctappNotConfigured
        }
        
        userDefaults.set(value, forKey: key)
    }
    
    /// Retrieves a stored `Codable` value from `UserDefaults`.
    ///
    /// - Parameters:
    ///   - type: The expected type of the stored value.
    ///   - key: The unique key under which the value is stored.
    /// - Returns: The retrieved value of type `T`, or `nil` if no value exists.
    /// - Throws: `ArctError.arctappNotConfigured` if `UserDefaults` is not set up.
    public func read<T>(_ type: T.Type, for key: String) throws(ArctError) -> T? where T: Codable {
        guard let userDefaults else {
            throw .arctappNotConfigured
        }
        
        return userDefaults.value(forKey: key) as? T
    }
    
    /// Deletes a stored value from `UserDefaults` for the given key.
    ///
    /// - Parameter key: The unique key associated with the value to be removed.
    /// - Throws: `ArctError.arctappNotConfigured` if `UserDefaults` is not set up.
    public func delete(for key: String) throws(ArctError) -> Void {
        guard let userDefaults else {
            throw .arctappNotConfigured
        }
        
        userDefaults.removeObject(forKey: key)
    }
}
