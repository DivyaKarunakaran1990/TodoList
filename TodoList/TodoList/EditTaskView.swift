//
//  EditTaskView.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 17/07/2026.
//

import SwiftUI

struct TaskDetailView: View {

    @Binding var task: Task

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        Form {

            Section("Task") {

                TextField("Task Title", text: $task.title)

                Toggle("Completed", isOn: $task.isCompleted)

            }

            Button("Save") {
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
