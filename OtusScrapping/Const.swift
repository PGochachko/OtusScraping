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
          "img": "img.updates__cover",
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

//let ranobelib: String = """
//{
//  "resource": {
//    "img": {
//      "findType": "selector",
//      "findProperties": {
//        "selector": "div.testclass"
//      }
//    },
//    "title": {
//      "findType": "selector",
//      "findProperties": {
//        "selector": "div.testclass"
//      }
//    },
//    "navigator": {
//      "navTo": {
//        "findType": "selector",
//        "findProperties": {
//          "selector": "div.testclass"
//        }
//      },
//      "contentType": "item",
//      "content": {
//        "img": {
//          "findType": "selector",
//          "findProperties": {
//            "selector": ""
//          }
//        },
//        "title": {
//          "findType": "selector",
//          "findProperties": {
//            "selector": ""
//          }
//        },
//        "description": {
//          "findType": "selector",
//          "findProperties": {
//            "selector": ""
//          }
//        },
//        "date": {
//          "findType": "selector",
//          "findProperties": {
//            "selector": ""
//          }
//        },
//        "views": {
//          "findType": "selector",
//          "findProperties": {
//            "selector": ""
//          }
//        }
//      }
//    }
//  }
//}
//"""
