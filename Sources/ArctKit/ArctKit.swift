// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

public final class ArctImpl: NSObject, ObservableObject, @unchecked Sendable {
    private override init() { super.init() }
    internal static let shared: ArctImpl = ArctImpl()
    
    // MARK: - Immutable Members
    
    // MARK: - Listenable Members (Mutable)
    
    @Published var routeStack: NavigationPath = NavigationPath()
    @Published var initialRoute: (any ArctRoute)? = nil
    
    // MARK: - Mutable Members
}

public let Arct = ArctImpl.shared
