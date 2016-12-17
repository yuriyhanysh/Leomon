//
//  API.swift
//  Leomon
//
//  Created by Yuriy Hanysh on 12/11/16.
//  Copyright © 2016 Yuriy Hanysh. All rights reserved.
//

import Foundation

enum API {
    case stops
    case routes
    case prognosis(stopCode: String)
    case routeStops(routeCode: String)
    case routePath(routeCode: String)
    case routeTransport(routeCode: String)
}

extension API {
    var baseURL: URL { return URL(string: "http://82.207.107.126:13541/SimpleRIDE/LAD/SM.WebApi/api")! }
    
    var path: String {
        switch self {
        case .stops:
            return "/stops"
        case .routes:
            return "/CompositeRoute"
        case .prognosis(stopCode: let stopCode):
            return "/stops/?code=\(stopCode)"
        case .routeStops(routeCode: let routeCode):
            return "/CompositeRoute/?code=\(routeCode)"
        case .routePath(routeCode: let routeCode):
            return "/path/?code=\(routeCode)"
        case .routeTransport(routeCode: let routeCode):
            return "/RouteMonitoring/?code=\(routeCode)"
        }
    }
    
    var requestURL: URL {
        return baseURL.appendingPathComponent(path)
    }
}
