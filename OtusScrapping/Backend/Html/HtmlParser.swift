//
//  HtmlParser.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation
import SwiftSoup

protocol HtmlParserProtocol {
    func findElementsBySelector(selector: String) -> Array<HtmlElementProtocol>
}

struct HtmlParcer: HtmlParserProtocol {
    private let doc: Document
 
    init(html: String) throws {
        self.doc = try SwiftSoup.parse(html)
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
    
    func findElementsBySelector(selector: String) -> Array<HtmlElementProtocol> {
        do {
            let elements = try doc.select(selector)
            return elements.array()
                .map({
                    HtmlElement(element: $0)
                })
        } catch {
            return Array()
        }
    }
    
    func getContents(category: CategoryConfig) -> Array<ContentItem> {
        var contents = Array<ContentItem>()
        if let element = category.element {
            let htmlElements = findElementsBySelector(selector: element)
            for htmlElement: HtmlElementProtocol in htmlElements {
                let content = getContentsFrom(parser: htmlElement, category: category)
                contents.append(content)
            }
        } else {
            let content = getContentsFrom(parser: self, category: category)
            contents.append(content)
        }
        
        return contents
    }
    
    func getPageContent(category: CategoryConfig) -> PageContent {
        var pageContent = PageContent()
        if let navTitleSeletor = category.navTitle {
            pageContent.navTitle = findElementsBySelector(selector: navTitleSeletor).last?.text()
        }
        return pageContent
    }
        
    private func getContentsFrom(parser: HtmlParserProtocol, category: CategoryConfig) -> ContentItem {
        var content = ContentItem()
        if let imgSelector = category.content.img {
            content.imgUrl = parser.findElementsBySelector(selector: imgSelector).last?.attr(key: "src")
        }

        content.imgDomain = category.content.imgDomain
        
        if let titleSelector = category.content.title {
            content.title = parser.findElementsBySelector(selector: titleSelector).last?.text()
        }
        if let descSelector = category.content.description {
            content.description = parser.findElementsBySelector(selector: descSelector).last?.text()
        }
        if let dateSelector = category.content.date {
            content.date = parser.findElementsBySelector(selector: dateSelector).last?.text()
        }
        if let viewsSelector = category.content.views {
            content.views = parser.findElementsBySelector(selector: viewsSelector).last?.text()
        }
        if let hrefSelector = category.content.href {
            content.href = parser.findElementsBySelector(selector: hrefSelector).last?.attr(key: "href")
        }
        if let textSelector = category.content.text {
            content.text = parser.findElementsBySelector(selector: textSelector).last?.text()
        }
        return content
    }
}
