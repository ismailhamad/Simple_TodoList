//
//  NoItemList.swift
//  TodoList
//
//  Created by Ismail on 17/05/2022.
//

import SwiftUI

struct NoItemList: View {
    @State var animate:Bool = false
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no items🫠")
                    .font(.title2)
                    .fontWeight(.semibold)
                   
               Text("Are you a productive person? i think you should click add button and add abunch of item to your todo list")
                    .padding([.bottom,.top] ,10)
                NavigationLink {
                    Add_todo()
                } label: {
                    Text("add todolist 🥳")
                        .foregroundColor(Color.white)
                        .frame(height:50)
                        .frame(maxWidth:.infinity)
                        .background(animate ? Color.blue : Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal, animate ? 30 :60)
                        .shadow(color: animate ?Color.blue .opacity(0.3):Color.red .opacity(0.3), radius: 10, x: 0, y: 30)
                        .offset(y: animate ? -10:0)
                        
                        
                }

            }
            .multilineTextAlignment(.center)
            .padding()
            .onAppear(perform: addAnimation)

        }
        .navigationTitle("Todo List🔖")
      
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
        
    }
}

struct NoItemList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemList()
        }
    }
}
