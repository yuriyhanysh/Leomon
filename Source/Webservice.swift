//
//  Webservice.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/12/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

open class Webservice {
    open func request(_ target: API, completion: @escaping (Result<Any>) -> Void) {
        URLSession.shared
            .dataTask(with: target.requestURL) { data, _, _ in
                let json = data
                    .flatMap { try? JSONSerialization.jsonObject(with: $0, options: .allowFragments) }
                    .flatMap { $0 as? String }
                    .flatMap { $0.data(using: .utf8) }
                    .flatMap { try? JSONSerialization.jsonObject(with: $0) }
                
                guard let unwrapped = json else {
                    completion(.failure(LeomonError.jsonObjectCreationFailure))
                    return
                }
                
                completion(.success(unwrapped))
            }
            .resume()
    }
}
