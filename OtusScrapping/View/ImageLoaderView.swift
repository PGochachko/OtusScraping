//
//  SwiftUIView.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import SwiftUI

import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var loaded: Bool = false
    @Published var image: UIImage?
    
    private let url: String
    private var cancellable: AnyCancellable?
    
    init(url: String) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }

    func load() {
        cancellable = HttpRequest(url: url).request()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                print(result)
                self.loaded = true
            }, receiveValue: { data in
                self.image = UIImage(data: data)
            })
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: String, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.loaded == true {
                if loader.image != nil {
                    Image(uiImage: loader.image!)
                        .resizable()
                } else {
                    
                }
            } else {
                placeholder
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(
            url: "",
            placeholder: Text("Loading ...")
        )
    }
}
