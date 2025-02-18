//
//  ArctRoute.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

/// A protocol representing a navigable route within the app.
/// - Conforms to `ArctEntityIterable`, implying that it can iterate over entities.
/// - Conforms to `Sendable`, ensuring thread safety when used in concurrent environments.
public protocol ArctRoute: ArctEntityIterable, Sendable {}

