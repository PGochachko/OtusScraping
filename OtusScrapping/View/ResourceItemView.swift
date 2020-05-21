//
//  SwiftUIView.swift
//  OtusScrapping
//
//  Created by Павел on 18.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI

struct ResourceItemView: View {
    let content: ContentItem
    
    var body: some View {
        HStack {
            AsyncImage(
                url: (self.content.imgDomain ?? "") + (self.content.imgUrl ?? ""),
                placeholder: Text("Loading...")
            )
                .scaledToFit()
                .frame(width: 60, height: 100, alignment: .center)
            VStack(alignment: .leading) {
                Text(self.content.title ?? "")
                    .font(.title)
                    .lineLimit(1)
                Text(self.content.description ?? "")
                    .font(.subheadline)
                    .lineLimit(3)
                Spacer()
                HStack {
                    Text(self.content.date ?? "")
                        .font(.subheadline)
                    Spacer()
                    Text(self.content.views ?? "")
                        .font(.subheadline)
                }
             }
        }
    }
}

struct ResourceItemView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItemView(content: ContentItem())
    }
}
