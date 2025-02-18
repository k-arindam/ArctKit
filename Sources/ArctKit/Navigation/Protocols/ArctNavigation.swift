//
//  ArctNavigation.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

internal protocol ArctNavigation {
    func push<T>(_: T) -> Void where T: ArctRoute
    func pushReplacement<T>(_: T) -> Void where T: ArctRoute
    
    func pop() -> Void
    func popToRoot() -> Void
    
    func replaceRoot<T>(with route: T) -> Void where T: ArctRoute
}
