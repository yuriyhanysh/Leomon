//
//  MonitoringTests.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import XCTest
@testable import Leomon

class MonitoringTests: XCTestCase {
    let expected = Monitoring(
        vehicle: Vehicle(
            id: 38066,
            name: "ВС 5701 АА"
        ),
        coordinate: Coordinate(
            longitude: 24.1372666666667,
            latitude: 49.8211
        ),
        angle: 90.0
    )
    let fixture = Fixture.with(name: "Monitoring")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatItCreatesRouteFromJSON() {
        let actual = try! Monitoring.decode(fixture)
        
        XCTAssertEqual(expected.angle, actual.angle)
        XCTAssertEqual(expected.vehicle.id, actual.vehicle.id)
        XCTAssertEqual(expected.vehicle.name, actual.vehicle.name)
        XCTAssertEqual(expected.coordinate.longitude, actual.coordinate.longitude)
        XCTAssertEqual(expected.coordinate.latitude, actual.coordinate.latitude)
    }
    
    func testThatItDoesNotCreateRouteFromWrongJSON() {
        let wrongJSON: Any = [
            "Vehicle": "AAA",
            "X": 4313,
            "Angle": "34.5"
        ]
        
        let actual = try? Monitoring.decode(wrongJSON)
        
        XCTAssertNil(actual)
    }
}
