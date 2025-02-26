//
//  ArctStorage.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

/// A protocol defining a storage mechanism for the `Arct` framework.
///
/// This protocol provides an abstraction for reading, writing, and deleting
/// data in a storage system, with support for `Codable` types.
///
/// - Error Handling: Each method can throw an `ArctError` in case of failure.
internal protocol ArctStorage {
    
    /// Writes a value to storage for the given key.
    ///
    /// - Parameters:
    ///   - value: The `Codable` value to store.
    ///   - key: The unique key under which the value should be stored.
    /// - Throws: `ArctError` if the write operation fails.
    func write<T>(_ value: T, for key: String) throws(ArctError) -> Void where T: Codable
    
    /// Reads a stored value of a specified type from storage.
    ///
    /// - Parameters:
    ///   - type: The expected type of the stored value.
    ///   - key: The unique key under which the value is stored.
    /// - Returns: The retrieved value of type `T`, or `nil` if no value exists.
    /// - Throws: `ArctError` if the read operation fails.
    func read<T>(_ type: T.Type, for key: String) throws(ArctError) -> T? where T: Codable
    
    /// Deletes a stored value for the given key.
    ///
    /// - Parameter key: The unique key associated with the value to be removed.
    /// - Throws: `ArctError` if the delete operation fails.
    func delete(for key: String) throws(ArctError) -> Void
}
