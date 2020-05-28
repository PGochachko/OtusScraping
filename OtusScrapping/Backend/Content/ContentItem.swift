//
//  ResourceItem.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct ContentItem: Identifiable {
    var id = UUID()
    
    var imgUrl: String? = nil
    var imgDomain: String? = nil
    var title: String? = nil
    var description: String? = nil
    var date: String? = nil
    var views: String? = nil
    var href: String? = nil
    var hrefDomain: String? = nil
    var text: String? = nil
    
    var category: CategoryConfig? = nil
}
