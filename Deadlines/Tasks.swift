//
//  Tasks.swift
//  Deadlines
//
//  Created by Matteo on 02/01/2023.
//

import Foundation

class Tasks: ObservableObject {
    @Published var items = [TaskElement]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let savedTasks = UserDefaults.standard.data(forKey: "items") {
            if let decoded = try? JSONDecoder().decode([TaskElement].self, from: savedTasks) {
                
                items = decoded
                return
            }
        }
        items = []
    }
}
