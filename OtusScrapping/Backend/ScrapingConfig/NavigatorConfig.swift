//
//  Navigator.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct NavigatorConfig<T: Decodable>: Decodable {
    enum ContentType: String, Decodable {
        case item, news
    }
    
    let navTo: ElementFinderConfig
    let contentType: ContentType
    let content: T
}
