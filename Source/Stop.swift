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
    var id: Int
    var code: String
    var name: String
    var coordinates: Coordinates
}

extension Stop: Decodable {
    public static func decode(_ json: Any) throws -> Stop {
        return try Stop(
            id: json => "Id",
            code: json => "Code",
            name: json => "Name",
            coordinates: (longitude: json => "X", latitude: json => "Y")
        )
    }
}
