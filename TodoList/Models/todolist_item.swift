//
//  todolist_item.swift
//  TodoList
//
//  Created by Ismail on 16/05/2022.
//

import Foundation

struct todolist_item:Identifiable,Codable {
    var id:String = UUID().uuidString
    var text:String
    var isComplete:Bool
}
