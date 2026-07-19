//
//  EditTaskView.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 17/07/2026.
//

import SwiftUI

struct TaskDetailView: View {

    @Binding var task: Task
    @State private var editedTask: Task

    @Environment(\.dismiss) private var dismiss
    
    init(task: Binding<Task>) {
        self._task = task
        self._editedTask = State(initialValue: task.wrappedValue)
    }

    var body: some View {

        Form {

            Section("Task") {

                TextField("Task Title", text: $editedTask.title)

                Toggle("Completed", isOn: $editedTask.isCompleted)

            }

            Button("Save") {
               task = editedTask
                dismiss()
            }
            
            Button("Cancel") {
                dismiss()
            }
        }
        .navigationTitle("Task Details")
    }
}

#Preview {
    NavigationStack {
        TaskDetailView(task: .constant(Task(title: "Learn SwiftUI")))
    }
}
