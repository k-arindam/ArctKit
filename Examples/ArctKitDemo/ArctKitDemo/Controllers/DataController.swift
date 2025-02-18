//
//  DataController.swift
//  ArctKitDemo
//
//  Created by Arindam Karmakar on 18/02/25.
//

import Foundation
import ArctKit

final class DataController: ArctController {
    @Published var counter: Int = 0
    
    func increase() -> Void {
        counter += 1
    }
    
    func decrease() -> Void {
        counter -= 1
    }
}
