//
//  Result.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/18/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension Result {
    public var isSuccess: Bool {
        if case .success = self {
            return true
        }
        
        return false
    }
    
    public var isFailure: Bool {
        if case .failure = self {
            return true
        }
        
        return false
    }
}

extension Result {
    public var value: Value? {
        if case .success(let value) = self {
            return value
        }
        
        return nil
    }
    
    public var error: Error? {
        if case .failure(let error) = self {
            return error
        }
        
        return nil
    }
}

extension Result: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success:
            return "Success"
        case .failure:
            return "Failure"
        }
    }
}

extension Result: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "Success: \(value)"
        case .failure(let error):
            return "Failure: \(error)"
        }
    }
}

extension Result {
    public func map<U>(_ transform: (Value) throws -> U) rethrows -> Result<U> {
        switch self {
        case .success(let value):
            return .success(try transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func flatMap<U>(_ transform: (Value) throws -> Result<U>) rethrows -> Result<U> {
        switch self {
        case .success(let value):
            return try transform(value)
        case .failure(let error):
            return .failure(error)
        }
    }
}
