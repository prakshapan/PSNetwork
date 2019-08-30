//
//  Routing.swift
//  TestNetwork
//
//  Created by Praks on 8/30/19.
//  Copyright © 2019 Praks. All rights reserved.
//

import Foundation
import PSNetwork


enum Routing: Router {
    // MARK:- Main Base Url

    static let baseUrl = "https://www.eremit.com.my"
    static let mainUrl = baseUrl + "/api/"

    case listExchageRate

    // Config Urls
    var url: NSURL {
        switch self {
        case .listExchageRate:
            return NSURL(string: Routing.mainUrl + "list/exchangerate")!
        }
    }

    // Config Methods Type
    var method: String {
        switch self {
        case .listExchageRate:
            return "GET"
        default:
            return "POST"
        }

    }

    // Config Headers
    var headers: Dictionary<String, String> {
        switch self {

        default:
            return ["Content-Type": "application/json",
                    "DeviceType": "IOS",
                    "DeviceKey": "",
            ]
        }
    }

    var parameters: Dictionary<String, Any> {
        switch self {
        default: return [:]
        }
    }

}
