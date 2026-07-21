//
//  EditTaskView.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 17/07/2026.
//

import SwiftUI
import SwiftData

struct TaskDetailView: View {

    @Bindable var task: Task
 

    @Environment(\.dismiss) private var dismiss
    
  

    var body: some View {

        Form {

            Section("Task") {

                TextField("Task Title", text: Bindable(task).title)

                Toggle("Completed", isOn: Bindable(task).isCompleted)

            }

           Button("Done") {
                dismiss()
            }
        }
        .navigationTitle("Task Details")
    }
}

#Preview {
    let container = try! ModelContainer(for: Task.self)

    return NavigationStack {
        TaskDetailView(task: Task(title: "Learn Swift"))
    }
    .modelContainer(container)
}
