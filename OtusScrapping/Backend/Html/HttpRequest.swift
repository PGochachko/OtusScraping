//
//  HttpRequest.swift
//  OtusScrapping
//
//  Created by Павел on 19.05.2020.
//  Copyright © 2020 pgochachko. All rights reserved.
//

import Foundation
import Combine

struct HttpRequest {
    let url: String

    func request() -> Future<Data, Error> {
        return Future<Data, Error> { promice in
            guard let url = URL(string: self.url)
            else {
                promice(.failure(HttpRequestError.invalidUrl))
                return
            }
            
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    promice(.failure(error))
                } else if let data = data {
                    promice(.success(data))
                }
            })
            
            task.resume()
        }
    }
    
    enum HttpRequestError: Error {
        case invalidUrl
    }
}
