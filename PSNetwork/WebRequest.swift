//
//  CustomConstructableRequest.swift
//  Remittance
//
//  Created by Praks on 1/9/19.
//  Copyright © 2019 Eightsquare Pvt. Ltd. All rights reserved.
//

import Foundation

public struct WebRequest {
    public init(router: Router) {
        self.router = router
    }

    var router: Router!

    var url: NSURL {
        return router.url
    }

    var method: String {
        return router.method
    }

    var parameters: Dictionary<String, Any> {
        return router.parameters
    }

    var headers: Dictionary<String, String> {
        return router.headers
    }
    
    public func buildRequest() -> URLRequest {
        var request = URLRequest(url: url as URL)
        if method != "GET" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // TODO: Configure for other Methods (DELETE, PUT etc....)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        return request
    }
}
