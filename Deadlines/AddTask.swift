//
//  AddTask.swift
//  Deadlines
//
//  Created by Matteo on 02/01/2023.
//

import SwiftUI

struct AddTask: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var tasks: Tasks
    
    @State var task = TaskElement(title: "", description: "", deadline: Date(), completed: false)
    
    var body: some View {
        VStack{
            Form {
                Section{
                    TextField("Title", text: $task.title)
                    
                    TextField("Description", text: $task.description)
                    
                    DatePicker("Due by", selection: $task.deadline, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(
                    "Cancel",
                    role: .cancel,
                    action: {
                        dismiss()
                    }
                )
                .foregroundColor(Color(red: 180/255, green: 150/255, blue: 0/255))
                
                Spacer()
                
                Button("Submit") {
                    tasks.items.append(task)
                    dismiss()
                }
                
                Spacer()
            }
            .font(.title2)
            
        }
        
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(tasks: Tasks())
    }
}
