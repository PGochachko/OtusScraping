//
//  Const.swift
//  OtusScrapping
//
//  Created by Павел on 20.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation

let ranobelib: String = """
{
  "category": {
    "contentType": "resource",
    "content": {
      "img": "a.header__logo img",
      "title": "div.footer__copyright a",
      "href": "div.footer__copyright a",
      "category": {
        "contentType": "item",
        "element": "div.updates__item",
        "navTitle": "strong.section__header-title",
        "content": {
          "imgDataSrc": "img.updates__cover",
          "imgDomain": "https://ranobelib.me",
          "title": "a.link-default",
          "date": "div.updates__date",
          "href": "a.link-default",
          "category": {
            "contentType": "item",
            "element": "div.chapter-item",
            "navTitle": "div.section__header strong",
            "content": {
              "title": "a.link-default",
              "date": "div.chapter-item__date",
              "href": "a.link-default",
              "category": {
                "contentType": "news",
                "navTitle": "div.reader-header-info__name-rus",
                "content": {
                  "text": "div.reader-container"
                }
              }
            }
          }
        }
      }
    }
  }
}
"""

let rianews = """
{
  "category": {
    "contentType": "resource",
    "content": {
      "title": "title",
      "href": "a.header__sticked-link-ria",
      "category": {
        "contentType": "item",
        "element": "div.cell-extension__item",
        "content": {
          "title": "span.cell-extension__item-title span",
          "href": "a.cell-extension__item-link",
          "hrefDomain": "https://ria.ru",
          "category": {
            "contentType": "item",
            "element": "div.list-item",
            "navTitle": "a.tag-input__tag-text",
            "content": {
              "img": "img.m-list-img",
              "title": "a.list-item__title",
              "date": "div.list-item__date",
              "views": "div.list-item__views-text",
              "href": "a.list-item__title",
              "category": {
                "contentType": "news",
                "navTitle": "h1.article__title",
                "content": {
                  "text": "div.article__body"
                }
              }
            }
          }
        }
      }
    }
  }
}
"""

