//
//  Route.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation
import Decodable

public struct Route {
    public var id: Int
    public var code: String
    public var name: String
}

extension Route: Decodable {
    public static func decode(_ json: Any) throws -> Route {
        return try Route(
            id: json => "Id",
            code: json => "Code",
            name: json => "Name"
        )
    }
}
