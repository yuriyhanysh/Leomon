//
//  Client.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/12/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

open class Client {
    var session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    open func request(_ target: API, completion: @escaping (Any?) -> Void) {
        session.dataTask(with: target.requestURL) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data)
            
            completion(json)
        }
    }
}
