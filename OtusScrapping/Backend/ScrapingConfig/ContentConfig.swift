//
//  Content.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

class ContentConfig: Decodable {
    let img: String?
    let imgDataSrc: String?
    let imgDomain: String?
    let title: String?
    let description: String?
    let date: String?
    let views: String?
    let href: String?
    let hrefDomain: String?
    let text: String?
    let category: CategoryConfig?
}
