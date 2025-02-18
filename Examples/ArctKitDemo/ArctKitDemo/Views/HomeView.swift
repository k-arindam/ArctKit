//
//  HomeView.swift
//  ArctKitDemo
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI
import ArctKit

struct HomeView: View {
    @ObservedObject var data: DataController = try! Arct.find(with: Constants.dataControllerKey)
    
    var body: some View {
        VStack {
            Text("\(data.counter)")
            
            HStack {
                Button("-") {
                    data.decrease()
                }
                .buttonStyle(.borderedProminent)
                
                Button("+") {
                    data.increase()
                }
                .buttonStyle(.borderedProminent)
            }
            
            Button("Open Settings") {
                Arct.push(AppRoutes.settings)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Demo Home")
    }
}

#Preview {
    HomeView()
}
