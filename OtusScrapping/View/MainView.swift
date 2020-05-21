//
//  ContentView.swift
//  OtusScrapping
//
//  Created by Павел on 18.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    
    private (set) var contents: Array<ContentItem> = Array()
    private (set) var futureCategory: CategoryConfig? = nil
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.loadContent()
    }

    
    func loadContent() {
        do {
            let resources: [(url: String, scrapingConfig: ScrapingConfig)] = [
                (url: "https://ranobelib.me", scrapingConfig: try ScrapingConfig.parce(json: ranobelib))
            ]
            
            let resource = resources[0]
            HttpRequest(url: resource.url)
                .request()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { result in
                    print(result)
                }, receiveValue: { htmlData in
                    do {
                        let html = String(decoding: htmlData, as: UTF8.self)
                        let htmlParcer = try HtmlParcer(html: html)
                        self.contents = htmlParcer.getContents(category: resource.scrapingConfig.category)
                        self.futureCategory = resource.scrapingConfig.category.content.category
                        self.isLoading = false
                    } catch let error {
                        print(error)
                    }
                    
                })
                .store(in: &self.subscriptions)
            
        } catch let error {
            print(error)
        }
    }
}


struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                if (!self.viewModel.isLoading) {
                    List(self.viewModel.contents) { content in
                        NavigationLink(destination: ControllerView(href: content.href,
                                                                   category: self.viewModel.futureCategory)) {
                            ResourceItemView(content: content)
                        }
                    }
                        .navigationBarTitle("Ресурсы")
                        .navigationBarItems(trailing:
                            NavigationLink(destination: AddResourceView()) {
                                Text("Добавить")
                            }
                        )
                } else {
                    Text("Loading...")
                }
            }
        }
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}
