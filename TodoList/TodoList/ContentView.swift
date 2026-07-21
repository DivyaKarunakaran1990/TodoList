//
//  ContentView.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 16/07/2026.
//

import SwiftUI
import SwiftData

//struct Task: Identifiable {
//    let id = UUID()
//    var title: String
//    var isCompleted: Bool = false
//}

struct ContentView: View {

//    @State private var tasks = ["Learn Swift", "create login screen", "Integrate REST API"]
//    @State private var tasks = [
//        Task(title: "Implement SwiftUI login screen"),
//            Task(title: "Integrate REST API authentication"),
//            Task(title: "Review app architecture"),
//            Task(title: "Improve application performance"),
//            Task(title: "Fix production crash issue"),
//            Task(title: "Deploy new build"),
//            Task(title: "Update CI/CD pipeline")
//    ]
    
    @Query private var tasks: [Task]
    @State private var newTask = ""
    @State private var message = ""
    
    
    @Environment(\.modelContext) private var modelContext

    var body: some View {

        NavigationStack {
            VStack {

                Text("My Tasks")
                    .font(.title)
                
                Text("\(tasks.count) Tasks")

                List {
                    ForEach(tasks) { task in
                        NavigationLink {
                            // Destination
                            TaskDetailView(task: task)
                        } label: {
                            TaskRow(task: task)
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let task = tasks[index]
                            modelContext.delete(task)
                        }
                    }
                    
                }

                TextField("Enter task", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Button("Add Task") {

                    let trimmedTask = newTask.trimmingCharacters(in: .whitespacesAndNewlines)

                    if trimmedTask.isEmpty {
                        message = "Please enter a task"
                    }
                    else if tasks.contains(where: { $0.title.lowercased() == trimmedTask.lowercased() }) {
                        message = "Task already exists"
                    }
                    else {

                        let task = Task(title: trimmedTask)

                        modelContext.insert(task)

                        do {
                            try modelContext.save()
                            print("✅ Saved:", task.title)
                        } catch {
                            print("❌ Save error:", error)
                        }

                        newTask = ""
                        message = "Task added successfully"
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .frame(maxWidth: .infinity)
                Text(message)
                    .foregroundStyle(.red)
            }
            .navigationTitle("Todo List")
        }
    }
}
