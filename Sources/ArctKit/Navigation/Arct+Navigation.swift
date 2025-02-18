//
//  Arct+Navigation.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation

extension ArctImpl: ArctNavigation {
    public func push<T>(_ route: T) -> Void where T: ArctRoute {
        DispatchQueue.main.async {
            self.routeStack.append(route)
        }
    }
    
    public func pushReplacement<T>(_ route: T) -> Void where T: ArctRoute {
        pop(count: 1) {
            self.routeStack.append(route)
        }
    }
    
    private func pop(count: Int, completion: (@Sendable () -> Void)? = nil) -> Void {
        DispatchQueue.main.async {
            if !self.routeStack.isEmpty {
                self.routeStack.removeLast(count)
            }
            
            completion?()
        }
    }
    
    public func pop() -> Void { pop(count: 1) }
    
    public func popToRoot() -> Void { pop(count: self.routeStack.count) }
    
    public func replaceRoot<T>(with route: T) -> Void where T: ArctRoute {
        DispatchQueue.main.async {
            self.initialRoute = route
        }
    }
}
