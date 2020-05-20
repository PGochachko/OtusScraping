//
//  ContentView.swift
//  OtusScrapping
//
//  Created by Павел on 18.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI
import Combine

struct TodoItem: Identifiable {
   var id = UUID()
}

final class MainViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    func test() {
        HttpRequest(url: "https://ranobelib.me")
            .request()
            .sink(receiveCompletion: { print("Completion \($0)") },
                  receiveValue: { _ in
//                    print("Value \($0)")

                    do {
                        let json = """
                        {
                          "resource": {
                            "img": {
                              "findType": "selector",
                              "findProperties": {
                                "selector": "div.testclass"
                              }
                            },
                            "title": {
                              "findType": "selector",
                              "findProperties": {
                                "selector": "div.testclass"
                              }
                            },
                            "navigator": {
                              "navTo": {
                                "findType": "selector",
                                "findProperties": {
                                  "selector": "div.testclass"
                                }
                              },
                              "contentType": "item",
                              "content": {
                                "img": {
                                  "findType": "selector",
                                  "findProperties": {
                                    "selector": ""
                                  }
                                },
                                "title": {
                                  "findType": "selector",
                                  "findProperties": {
                                    "selector": ""
                                  }
                                },
                                "description": {
                                  "findType": "selector",
                                  "findProperties": {
                                    "selector": ""
                                  }
                                },
                                "date": {
                                  "findType": "selector",
                                  "findProperties": {
                                    "selector": ""
                                  }
                                },
                                "views": {
                                  "findType": "selector",
                                  "findProperties": {
                                    "selector": ""
                                  }
                                }
                              }
                            }
                          }
                        }
                        """
                        let scrapingConf = try ScrapingConfig.parce(json: json)
                        print(scrapingConf.resource)
//                        let htmlParcer = try HtmlParcer(html: $0)
//                        let test = htmlParcer.test()
//                        print(test?.innerHtml())
//                        let items = htmlParcer.findElementsClass(className: "updates__item")
//                        for item: HtmlElementProtocol in items {
//                            print(item.innerHtml())
//                        }
                        
                    } catch let e {
                        print("Error: \(e)")
                    }
                  }
            )
            .store(in: &self.subscriptions)
    }
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

    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
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
            Button("Test") {
                self.viewModel.test()
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
