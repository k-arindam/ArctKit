//
//  Arct+Storage.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

extension ArctImpl: ArctStorage {
    public func write<T>(_ value: T, for key: String) -> Bool where T : Decodable, T : Encodable {
        true
    }
    
    public func read<T>(_ type: T.Type, for key: String) -> T? where T : Decodable, T : Encodable {
        String() as? T
    }
    
    public func remove(for key: String) -> Bool {
        true
    }
}
