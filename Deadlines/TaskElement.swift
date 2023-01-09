//
//  TaskElement.swift
//  Deadlines
//
//  Created by Matteo on 02/01/2023.
//

import Foundation

struct TaskElement: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var deadline: Date
    var completed: Bool
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let formattedDate = formatter.string(from: deadline)
        return formattedDate
    }
}
