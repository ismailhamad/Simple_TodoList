//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ismail on 16/05/2022.
//

import SwiftUI

@main
struct TodoListApp: App {

    @StateObject var todolistviewmodel:todolistViewModel = todolistViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoList()
            }.environmentObject(todolistviewmodel)
        }
    }
}
