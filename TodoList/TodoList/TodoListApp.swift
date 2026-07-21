//
//  TodoListApp.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 16/07/2026.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
