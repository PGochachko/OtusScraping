//
//  ControllerView.swift
//  OtusScrapping
//
//  Created by Павел on 21.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI
import Combine

final class ControllerViewModel: ObservableObject {
    private let url: String?
    private let category: CategoryConfig?
    private var contentDidLoad: Bool = false

    @Published private (set) var isLoading: Bool = true
    private (set) var contents: Array<ContentItem> = Array()
    private (set) var pageContent: PageContent? = nil
    
    @Published var contentType: CategoryConfig.ContentType = CategoryConfig.ContentType.item
    private var subscriptions = Set<AnyCancellable>()
    
    init(url: String?, category: CategoryConfig?) {
        self.url = url
        self.category = category
    }
    
    func loadContent() {
        if (self.contentDidLoad) {
            return
        }
        
        if let u = self.url, let c = self.category {
            HttpRequest(url: u)
                .request()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { result in
                    print(result)
                }, receiveValue: { htmlData in
                    do {
                        let html = String(decoding: htmlData, as: UTF8.self)
                        let htmlParcer = try HtmlParcer(html: html)
                        self.contents.append(contentsOf: htmlParcer.getContents(category: c))
                        self.pageContent = htmlParcer.getPageContent(category: c)
                        self.contentType = c.contentType
                        self.isLoading = false
                        self.contentDidLoad = true
                    } catch let error {
                        print(error)
                    }
                    
                })
                .store(in: &self.subscriptions)
        } else {
            self.isLoading = false
        }
    }
}


struct ControllerView: View {
    @ObservedObject var viewModel: ControllerViewModel
    
    init(href: String?, category: CategoryConfig?) {
        self.viewModel = ControllerViewModel(url: href, category: category)
    }
    
    var body: some View {
        VStack {
            if (self.viewModel.isLoading) {
                Text("Loading...")
            } else {
                if self.viewModel.contentType == CategoryConfig.ContentType.item {
                    List(self.viewModel.contents) { content in
                        NavigationLink(destination: ControllerView(href: (content.hrefDomain ?? "") + (content.href ?? ""),
                                                                   category: content.category)) {
                            ResourceItemView(content: content)
                        }
                    }
                } else if self.viewModel.contentType == CategoryConfig.ContentType.resource {
                    List(self.viewModel.contents) { content in
                        NavigationLink(destination: ControllerView(href: (content.hrefDomain ?? "") + (content.href ?? ""),
                                                               category: content.category)) {
                            ResourceItemView(content: content)
                        }
                    }
                } else {
                    List(self.viewModel.contents) { content in
                        Text(content.text ?? "")
                    }
                }
            }
        }
            .navigationBarTitle(self.viewModel.pageContent?.navTitle ?? "")
            .onAppear {
                self.viewModel.loadContent()
            }
    }
}

struct ControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ControllerView(href: nil, category: nil)
    }
}
