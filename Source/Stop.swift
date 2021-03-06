//
//  Stop.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/17/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation
import Decodable

public struct Stop {
    public var id: Int
    public var code: String
    public var name: String
    public var coordinate: Coordinate
}

extension Stop: Decodable {
    public static func decode(_ json: Any) throws -> Stop {
        return try Stop(
            id: json => "Id",
            code: json => "Code",
            name: json => "Name",
            coordinate: Coordinate(
                longitude: json => "X",
                latitude: json => "Y")
        )
    }
}
