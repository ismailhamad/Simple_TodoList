//
//  TodoList.swift
//  TodoList
//
//  Created by Ismail on 16/05/2022.
//

import SwiftUI

struct TodoList: View {
    @EnvironmentObject var todoListViewModeL:todolistViewModel
    var body: some View {
        if todoListViewModeL.item.isEmpty {
            NoItemList()
        
        }else{
            List{
                ForEach(todoListViewModeL.item) { item in
                    RowItem(todolist: item)
                }
                .onDelete { IndexSet in
                    todoListViewModeL.deleteTodo(index: IndexSet)
                }
                .onMove { IndexSet, Int in
                    todoListViewModeL.moveItem(from: IndexSet, to: Int)
                }
           
            }
            .listStyle(.inset)
            .navigationTitle("Todo List🔖")
            .navigationBarItems(leading:EditButton(), trailing:  NavigationLink("add", destination: {
                Add_todo()
            })
            )
        }
     
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoList()
        }.environmentObject(todolistViewModel())
    }
}
