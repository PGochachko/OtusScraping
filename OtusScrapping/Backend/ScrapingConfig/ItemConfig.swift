//
//  ItemConfig.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct ItemConfig: Decodable {
    let img: ElementFinderConfig
    let title: ElementFinderConfig
    let description: ElementFinderConfig
    let date: ElementFinderConfig
    let views: ElementFinderConfig
}
