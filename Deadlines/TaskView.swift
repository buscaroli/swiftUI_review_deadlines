//
//  TaskView.swift
//  Deadlines
//
//  Created by Matteo on 02/01/2023.
//

import SwiftUI

struct TaskView: View {
    @State var task: TaskElement
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(task.title)
                
                Spacer()
                
                Text(task.formattedDate).font(.caption)
            }
            .fontWeight(.bold)
            
            Text(task.description)
            
        }
        .padding()
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: TaskElement(title: "Finish Latest View", description: "Remember to implement the animation and push it.", deadline: Date(), completed: false))
    }
}
