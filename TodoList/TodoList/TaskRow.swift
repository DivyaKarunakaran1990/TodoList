    //
    //  TaskRow.swift
    //  TodoList
    //
    //  Created by DivyaKarunakaran on 16/07/2026.
    //

    import SwiftUI

    struct TaskRow: View {

        @Binding var task: Task
        

        var body: some View {

            HStack {

                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(task.isCompleted ? .green : .gray)

                Text(task.title)
                    .strikethrough(task.isCompleted)
                    .foregroundStyle(task.isCompleted ? .green : .primary)
            }
            
            
            .onTapGesture {
                task.isCompleted.toggle()
            }
        }
    }

    #Preview {
        TaskRow(task: .constant(Task(title: "Learn SwiftUI")))
    }
