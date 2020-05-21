//
//  AddResourceView.swift
//  OtusScrapping
//
//  Created by Павел on 19.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI

struct AddResourceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var url: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                TextField("URL", text: self.$url)
                Divider()
                Text("Укажите конфигурацию с правилами получения контента с указанной HTML страницы")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            VStack {
                Button(action: {
                }) {
                    Text("Выбрать конфигурацию")
                        .frame(width: 200)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                    .padding(.top, 16)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Добавить")
                        .frame(width: 200)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                    .padding(.top, 16)
            }
            Spacer()
        }
            .navigationBarTitle("Добавление ресурса")
            .padding()
    }
}

struct AddResourceView_Previews: PreviewProvider {
    static var previews: some View {
        AddResourceView()
    }
}
