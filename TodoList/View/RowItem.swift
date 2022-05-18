//
//  RowItem.swift
//  TodoList
//
//  Created by Ismail on 19/05/2022.
//

import SwiftUI

struct RowItem: View {
    @EnvironmentObject var todoListViewModeL:todolistViewModel
    let todolist:todolist_item
    var body: some View {
        HStack{
            Image(systemName: todolist.isComplete ? "checkmark.circle" : "circle")
                .font(.title2)
                .foregroundColor(todolist.isComplete ? Color.green :Color.red)
                .onTapGesture {
                    todoListViewModeL.updateitem(item_up: todolist)
                }
        
            Text(todolist.text )
                .font(.headline)
                .foregroundColor(todolist.isComplete ? Color.gray : Color.black)
                .background( todolist.isComplete ? Color(hue: 1.0, saturation: 0.024, brightness: 0.871, opacity: 0.682): Color.white)
                
                    
                
                
                
            
        }
    }

  
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        RowItem(todolist: todolist_item(id: "1", text: "dld", isComplete: false))
    }
}
