//
//  ScrapingConfig.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

struct ScrapingConfig: Decodable {
    let category: CategoryConfig

    static func parce(json: String) throws -> ScrapingConfig {
        let jsonData = json.data(using: .utf8)!
        return try! JSONDecoder().decode(ScrapingConfig.self, from: jsonData)
    }
}
