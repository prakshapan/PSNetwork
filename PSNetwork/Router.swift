//
//  Router.swift
//  PSNetwork
//
//  Created by Praks on 8/30/19.
//  Copyright © 2019 Praks. All rights reserved.
//

import Foundation

public protocol Router {
    var url: NSURL { get }
    var method: String { get }
    var headers: Dictionary<String, String> { get }
    var parameters: Dictionary<String, Any> { get }
}
