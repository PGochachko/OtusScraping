//
//  SwiftUIView.swift
//  OtusScrapping
//
//  Created by Павел on 18.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI

struct ResourceItemView: View {
    let title: String = "Заголовок"
    let description: String = "Очень длинное описание будущей новости, которое не должно помещаться в 1, то есть 2, а нет, даже в 3 строки, интересно посмотреть, как это будет выглядеть и каким образом в ios работает перенос строк в элементе Text"
    let date: String = "19.05.2020"
    let views: String = "209"
    
    var body: some View {
         NavigationLink(destination: ListView()) {
            HStack {
                Image("testImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120, alignment: .center)
                    .border(Color.blue, width: 3.0)
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.title)
                        .lineLimit(1)
                    Text(self.description)
                        .font(.subheadline)
                        .lineLimit(3)
                    Spacer()
                    HStack {
                        Text(self.date)
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "eye")
                            .font(.system(size: 16, weight: .thin))
                        Text(self.views)
                            .font(.subheadline)
                    }
                 }
            }
        }
    }
}

struct ResourceItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItemView()
    }
}
