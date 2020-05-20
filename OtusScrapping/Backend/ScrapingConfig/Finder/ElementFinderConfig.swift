//
//  ElementFinder.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct ElementFinderConfig: Decodable {
    enum FindType: String, Decodable {
        case selector
    }

    let findType: FindType
    let findProperties: SelectorProperties
}
