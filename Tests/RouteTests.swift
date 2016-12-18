//
//  RouteTests.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import XCTest
@testable import Leomon

class RouteTests: XCTestCase {
    let expected = Route(id: 713011, code: "C2|713011", name: "А36 Кропивницького - Винники")
    let fixture = Fixture.with(name: "Route")
    
    func testThatItCreatesRouteFromJSON() {
        let actual = try! Route.decode(fixture)
        
        XCTAssertEqual(expected.id, actual.id)
        XCTAssertEqual(expected.code, actual.code)
        XCTAssertEqual(expected.name, actual.name)
    }
    
    func testThatItDoesNotCreateRouteFromWrongJSON() {
        let wrongJSON: Any = [
            "Id": "713",
            "Code": 4313,
            "Name": 34.5
        ]
        
        let actual = try? Route.decode(wrongJSON)
        
        XCTAssertNil(actual)
    }
}
