//
//  ArctNavView.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI

internal struct ArctNavView<Child, Route>: View where Child: View , Route: ArctRoute {
    @ViewBuilder let routeBuilder: (Route) -> Child
    let initialRoute: Route
    
    internal init(@ViewBuilder routeBuilder: @escaping (Route) -> Child, initialRoute: Route) {
        self.routeBuilder = routeBuilder
        self.initialRoute = initialRoute
    }
    
    @ObservedObject var arct = Arct
    
    internal var body: some View {
        NavigationStack(path: $arct.routeStack) {
            Group {
                if let root = arct.initialRoute as? Route {
                    routeBuilder(root)
                } else {
                    Text("No initial route set!")
                }
            }
            .onAppear { arct.initialRoute = self.initialRoute }
            .navigationDestination(for: Route.self, destination: routeBuilder)
        }
    }
}
