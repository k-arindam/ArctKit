//
//  SettingsView.swift
//  ArctKitDemo
//
//  Created by Arindam Karmakar on 18/02/25.
//

import SwiftUI
import ArctKit

struct SettingsView: View {
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
        }
        .navigationTitle("Settings")
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

#Preview {
    SettingsView()
}
