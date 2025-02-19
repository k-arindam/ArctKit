//
//  ArctStorage.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

internal protocol ArctStorage {
    func write<T>(_ value: T, for key: String) -> Bool where T: Codable
    func read<T>(_ type: T.Type, for key: String) -> T? where T: Codable
    func remove(for key: String) -> Bool
}
