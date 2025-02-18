//
//  AppRoutes.swift
//  ArctKitDemo
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation
import SwiftUI
import ArctKit

enum AppRoutes: ArctRoute {
    case home
    case settings
    
    @ViewBuilder
    static func builder(_ route: Self) -> some View {
        switch route {
        case .home:
            HomeView()
        case .settings:
            SettingsView()
        }
    }
}
