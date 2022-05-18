//
//  todolistViewModel.swift
//  TodoList
//
//  Created by Ismail on 16/05/2022.
//

import Foundation

class todolistViewModel:ObservableObject{
    let item_list:String = "item_list"
    @Published var item:[todolist_item]=[]{
        didSet{
            savetodo()
        }
    }
    
    init(){
       getData()
    }
    
    func getData(){
        guard let data = UserDefaults.standard.data(forKey: item_list) else {return}
        guard let saveItems = try? JSONDecoder().decode([todolist_item].self, from: data) else {return}
        self.item = saveItems
        
    }
    
    func addTodo(text:String){
        var todo = todolist_item(id: UUID().uuidString, text: text, isComplete: false)
        self.item.append(todo)
    }
    
    func deleteTodo(index:IndexSet){
        item.remove(atOffsets:index)
    }
    func moveItem(from:IndexSet,to: Int){
        item.move(fromOffsets: from, toOffset: to)
    }
    
    func savetodo(){
        if let encodedData = try? JSONEncoder().encode(item){
            UserDefaults.standard.set(encodedData, forKey: item_list)

        }
    }
    
    func textIsAppropriate(text:String)->Bool{
        if text.count<3 || text.isEmpty{
            return false
        }
        return true
    }
    
    func updateitem(item_up:todolist_item){
        var index = item.firstIndex { todolist_item in
            todolist_item.id == item_up.id
        }
        
        item[index!] = todolist_item(id: UUID().uuidString, text:item_up.text, isComplete: !item_up.isComplete)
    }
}
