//
//  Navigator.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

class CategoryConfig: Decodable {
    enum ContentType: String, Decodable {
        case resource, item, news
    }
    
    let contentType: ContentType
    let element: String?
    let content: ContentConfig
    let navTitle: String?
}
