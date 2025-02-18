//
//  ArctKitDemoApp.swift
//  ArctKitDemo
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI
import ArctKit

@main
struct ArctKitDemoApp: App {
    let initialBindings = [Constants.dataControllerKey: DataController()]
    
    var body: some Scene {
        WindowGroup {
            ArctApp(routeBuilder: AppRoutes.builder, initialRoute: AppRoutes.home, initialBindings: initialBindings)
        }
    }
}
