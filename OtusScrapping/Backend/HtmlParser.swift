//
//  HtmlParser.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation
import SwiftSoup

struct HtmlParcer {
    private let doc: Document
    
    init(html: String) throws {
        doc = try SwiftSoup.parse(html)
    }
    
    func findElementsClass(className: String) -> Array<HtmlElementProtocol> {
        do {
            let elements = try doc.getElementsByClass(className)
            return elements.array()
                .map({
                    HtmlElement(element: $0)
                })
        } catch {
            return Array()
        }
    }
    
    func test() -> HtmlElement? {
        do {
            let elements = try doc.select("div.updates__left")
            return elements.array()
                .map({
                    HtmlElement(element: $0)
                })[0]
        } catch {
            return nil
        }
    }
}
