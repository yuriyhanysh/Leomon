//
//  Coordinate.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/17/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation
import Decodable

public struct Coordinate {
    public var longitude: Double
    public var latitude: Double
}

extension Coordinate: Decodable {
    public static func decode(_ json: Any) throws -> Coordinate {
        return try Coordinate(
            longitude: json => "X",
            latitude: json => "Y"
        )
    }
}
