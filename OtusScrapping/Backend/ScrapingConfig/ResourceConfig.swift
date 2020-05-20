//
//  ResourceConfig.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct ResourceConfig: Decodable {
    let img: ElementFinderConfig
    let title: ElementFinderConfig
    let navigator: NavigatorConfig<ItemConfig>
}
