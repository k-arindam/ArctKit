//
//  ArctEntities.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// A protocol representing an entity that can be serialized and hashed.
/// - Conforms to `Codable` for encoding/decoding and `Hashable` for hashing.
public protocol ArctEntity: Codable, Hashable {}

/// A protocol representing an entity that is identifiable with a unique identifier.
/// - Conforms to `ArctEntity` and `Identifiable` to ensure it has a unique `id` and is hashable.
public protocol ArctEntityIdentifiable: ArctEntity, Identifiable {}

/// A protocol representing an entity that is enumerable and can iterate over all cases.
/// - Conforms to `ArctEntity` and `CaseIterable` to support iteration over all possible values.
public protocol ArctEntityIterable: ArctEntity, CaseIterable {}
