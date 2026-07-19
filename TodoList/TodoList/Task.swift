//
//  Task.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 16/07/2026.


import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}


