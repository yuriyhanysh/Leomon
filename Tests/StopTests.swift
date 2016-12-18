//
//  StopTests.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import XCTest
@testable import Leomon

class StopTests: XCTestCase {
    let expected1 = Stop(
        id: 34602,
        code: "10143",
        name: "площа Кропивницького пр",
        coordinate: Coordinate(longitude: 24.0044, latitude: 49.83621))
    let expected2 = Stop(
        id: 36436,
        code: "0153",
        name: "Аеропорт (Термінал \"А\")",
        coordinate: Coordinate(longitude: 23.96037, latitude: 49.81379))
    
    let fixture1 = Fixture.with(name: "Stop1")
    let fixture2 = Fixture.with(name: "Stop2")
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatItCreatesStopFromJSON1() {
        let actual = try! Stop.decode(fixture1)
        
        XCTAssertEqual(expected1.id, actual.id)
        XCTAssertEqual(expected1.code, actual.code)
        XCTAssertEqual(expected1.name, actual.name)
        XCTAssertEqual(expected1.coordinate.latitude, actual.coordinate.latitude)
        XCTAssertEqual(expected1.coordinate.longitude, actual.coordinate.longitude)
    }
    
    func testThatItCreatesStopFromJSON2() {
        let actual = try! Stop.decode(fixture2)
        
        XCTAssertEqual(expected2.id, actual.id)
        XCTAssertEqual(expected2.code, actual.code)
        XCTAssertEqual(expected2.name, actual.name)
        XCTAssertEqual(expected2.coordinate.latitude, actual.coordinate.latitude)
        XCTAssertEqual(expected2.coordinate.longitude, actual.coordinate.longitude)
    }
    
    func testThatItDoesNotCreateStopFromWrongJSON() {
        let wrongJSON: Any = [
            "Id": "Wrong ID",
            "Code": 111,
            "Name": 234.3,
            "X": "34",
            "Y": "56"
        ]
        
        let actual = try? Stop.decode(wrongJSON)
        
        XCTAssertNil(actual)
    }
}
