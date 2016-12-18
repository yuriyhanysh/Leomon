//
//  Client.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/12/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

open class Client {
    public var session: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    open func request(_ target: API, completion: @escaping (Result<Any>) -> Void) {
        session.dataTask(with: target.requestURL) { data, _, _ in
            guard let data = data else {
                completion(.failure(LeomonError.responseFailure))
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data) else {
                completion(.failure(LeomonError.jsonObjectCreationFailure))
                return
            }
            
            completion(.success(json))
        }
    }
}
