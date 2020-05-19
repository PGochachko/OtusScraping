//
//  ContentView.swift
//  OtusScrapping
//
//  Created by Павел on 18.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI

struct TodoItem: Identifiable {
   var id = UUID()
}


struct MainView: View {
    var todoItems: [TodoItem] = [
       TodoItem(),
       TodoItem(),
       TodoItem(),
       TodoItem(),
       TodoItem(),
       TodoItem(),
       TodoItem()
    ]

    var body: some View {
        NavigationView {
            List(self.todoItems) { todoItem in
                    ResourceItemView()
            }
                .navigationBarTitle("Ресурсы")
                .navigationBarItems(trailing:
                    NavigationLink(destination: ListView()) {
                        Text("Добавить")
                    }
                )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
