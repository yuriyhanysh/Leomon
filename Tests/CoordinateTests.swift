//
//  CoordinateTests.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import XCTest
@testable import Leomon

class CoordinateTests: XCTestCase {
    var expected = Coordinate(longitude: 24.0013012214127, latitude: 49.8371024712426)
    var fixture = Fixture.with(name: "Coordinate")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatItCreatesRouteFromJSON() {
        let actual = try! Coordinate.decode(fixture)
        
        XCTAssertEqual(expected.longitude, actual.longitude)
        XCTAssertEqual(expected.latitude, actual.latitude)
    }
    
    func testThatItDoesNotCreateRouteFromWrongJSON() {
        let wrongJSON: Any = [
            "X": "713",
            "Y": 34.6,
        ]
        
        let actual = try? Coordinate.decode(wrongJSON)
        
        XCTAssertNil(actual)
    }
}
