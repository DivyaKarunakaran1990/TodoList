//
//  ContentView.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 16/07/2026.
//

import SwiftUI

struct ContentView: View {

    @State private var tasks = ["Learn Swift", "Buy Milk"]
    @State private var newTask = ""
    @State private var message = ""

    var body: some View {

        NavigationStack {
            VStack {

                Text("My Tasks")
                    .font(.title)

                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete { indexSet in
                        tasks.remove(atOffsets: indexSet)
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
                        else if tasks.contains(where: { $0.lowercased() == trimmedTask.lowercased() }) {
                            message = "Task already exists"
                        }
                        else {
                            tasks.append(trimmedTask)
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
