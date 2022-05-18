//
//  Add_todo.swift
//  TodoList
//
//  Created by Ismail on 16/05/2022.
//

import SwiftUI

struct Add_todo: View {
    @State var text:String = ""
    @EnvironmentObject var todolistviewmodel:todolistViewModel
    @Environment (\.presentationMode) var presentationMode
    @State var showalert:Bool = false
    var body: some View {
        VStack{
            TextField("add todo", text: $text)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.025, brightness: 0.932))
                .cornerRadius(20)
            Button {
                add_todo()
            } label: {
                Text("ADD")
                    .foregroundColor(Color.white)
                    .frame(width: 300, height: 50)
                    .background(
                        Color.blue
                    )
                    .cornerRadius(20)
            }
            Spacer()

        }.padding()
            .navigationTitle("add Todo🖋")
            .alert(isPresented:$showalert,content: {
     Alert(title:Text("your new todo must be at least 3 characters"))
            })
            
       
    }
    func add_todo(){
        if todolistviewmodel.textIsAppropriate(text: text){
            todolistviewmodel.addTodo(text: text)
            presentationMode.wrappedValue.dismiss()
        }else{
            showalert.toggle()
            
        }
       
    }
}

struct Add_todo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Add_todo().environmentObject(todolistViewModel())

        }
    }
}
