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
    var body: some Scene {
        let config = ArctAppConfig(
            appGroup: "group.in.karindam.ArctKitDemo",
            initialBindings: [
                Constants.dataControllerKey: DataController()
            ],
            initialRoute: AppRoutes.home,
            routeBuilder: AppRoutes.builder
        )
        
        WindowGroup {
            ArctApp(config: config)
        }
    }
}
