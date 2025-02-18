//
//  ArctEntities.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

public protocol ArctEntity: Codable, Hashable {}

public protocol ArctEntityIdentifiable: ArctEntity, Identifiable {}

public protocol ArctEntityIterable: ArctEntity, CaseIterable {}
