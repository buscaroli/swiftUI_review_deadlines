//
//  ContentView.swift
//  Deadlines
//
//  Created by Matteo on 02/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false
    @StateObject var tasks = Tasks()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(tasks.items) { item in
                    Section {
                        TaskView(task: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
            
            .navigationTitle("Deadlines")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showingSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                }
            .sheet(isPresented: $showingSheet) { AddTask(tasks: tasks)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        tasks.items.remove(atOffsets: offsets)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
