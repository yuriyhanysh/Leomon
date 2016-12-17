//
//  Fixture.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

final class Fixture {
    static func with(name: String) -> Any {
        let path = Bundle(for: self).url(forResource: name, withExtension: "json")
        let jsonObject = path
            .flatMap { path in try? Data(contentsOf: path) }
            .flatMap { data in try? JSONSerialization.jsonObject(with: data) }
        
        guard let object = jsonObject else {
            fatalError("No fixture with name: \(name)")
        }
        
        return object
    }
}
