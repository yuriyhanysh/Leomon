//
//  ResultTests.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import XCTest
@testable import Leomon

class ResultTests: XCTestCase {
    enum TestError: Error {
        case failure
    }
    
    let successResult = Result<String>.success("Success")
    let failureResult = Result<String>.failure(TestError.failure)
    
    func testThatIsSuccessReturnsTrueWhenSuccessCase() {
        XCTAssertTrue(successResult.isSuccess)
    }
    
    func testThatIsSuccessReturnsFalseWhenFailureCase() {
        XCTAssertFalse(failureResult.isSuccess)
    }
    
    func testThatIsFailureReturnsTrueWhenFailureCase() {
        XCTAssertTrue(failureResult.isFailure)
    }
    
    func testThatIsFailureReturnsFalseWhenSuccessCase() {
        XCTAssertFalse(successResult.isFailure)
    }
    
    func testThatValueIsNotNilWhenSuccessCase() {
        XCTAssertNotNil(successResult.value)
    }
    
    func testThatValueIsNilWhenFailureCase() {
        XCTAssertNil(failureResult.value)
    }
    
    func testThatErrorIsNotNilWhenFailureCase() {
        XCTAssertNotNil(failureResult.error)
    }
    
    func testThatErrorIsNilWhenSuccessCase() {
        XCTAssertNil(successResult.error)
    }
    
    func testThatDescriptionMatchesExpectedWhenSuccessCase() {
        let expected = "Success"
        
        XCTAssertEqual(successResult.description, expected)
    }
    
    func testThatDescriptionMatchesExpectedWhenFailureCase() {
        let expected = "Failure"
        
        XCTAssertEqual(failureResult.description, expected)
    }
    
    func testThatDebugDescriptionMatchesExpectedWhenSuccessCase() {
        let expected = "Success: Success"
        
        XCTAssertEqual(successResult.debugDescription, expected)
    }
    
    func testThatDebugDescriptionMatchesExpectedWhenFailureCase() {
        let expected = "Failure: failure"
        
        XCTAssertEqual(failureResult.debugDescription, expected)
    }
}
