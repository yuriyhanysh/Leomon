//
//  Monitoring.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation
import Decodable

public struct Monitoring {
    public var vehicle: Vehicle
    public var coordinate: Coordinate
    public var angle: Double
}

extension Monitoring: Decodable {
    public static func decode(_ json: Any) throws -> RouteMonitoringData {
        return try RouteMonitoringData(
            vehicle: Vehicle(
                id: json => "VehicleId",
                name: json => "VehicleName"),
            coordinate: Coordinate(
                longitude: json => "X",
                latitude: json => "Y"),
            angle: json => "Angle"
        )
    }
}
