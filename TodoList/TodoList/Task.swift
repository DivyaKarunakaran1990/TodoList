//
//  Task.swift
//  TodoList
//
//  Created by DivyaKarunakaran on 16/07/2026.


//import Foundation

//struct Task: Identifiable {
//    let id = UUID()
//    var title: String
//    var isCompleted: Bool = false
//}


import SwiftData

@Model
class Task {

    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
           self.title = title
           self.isCompleted = isCompleted
       }

}


