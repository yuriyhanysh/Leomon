//
//  Leomon.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

open class Leomon {
    public static func fetchStops(completion: @escaping (Result<[Stop]>) -> Void) {
        Client().request(.stops) { result in
            do {
                let stops = try result.map { try [Stop].decode($0) }
                completion(stops)
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    public static func fetchRoutes(completion: @escaping (Result<[Route]>) -> Void) {
        Client().request(.stops) { result in
            do {
                let routes = try result.map { try [Route].decode($0) }
                completion(routes)
            } catch {
                completion(.failure(error))
            }
        }
    }
}
