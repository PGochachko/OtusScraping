//
//  HtmlElement.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation
import SwiftSoup

protocol HtmlElementProtocol {
    func attr(key: String) -> String?
    func text() -> String?
    func innerHtml() -> String?
}

struct HtmlElement: HtmlElementProtocol {
    private let htmlElement: Element
    
    init(element: Element) {
        self.htmlElement = element
    }
    
    func attr(key: String) -> String? {
        do {
            let attr = try self.htmlElement.attr(key)
            return attr
        } catch {
            return nil
        }
    }
    
    func text() -> String? {
        do {
            let text = try self.htmlElement.text()
            return text
        } catch {
            return nil
        }

    }
    
    func innerHtml() -> String? {
        do {
            let innerHtml = try self.htmlElement.html()
            return innerHtml
        } catch {
            return nil
        }
    }
}
