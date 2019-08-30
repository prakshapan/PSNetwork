//
//  RxNetworkResponse.swift
//  Remittance
//
//  Created by Praks on 1/10/19.
//  Copyright © 2019 Eightsquare Pvt. Ltd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol RxNetworking {
    static func dataTask(with request: URLRequest) -> Observable<RxNetworkResponse?>
}

public enum RxNetworkResponse {
    case success(data: Data?)
    case failure(error: Error?)
    case urlResponse(urlResponse: HTTPURLResponse?)
    

    public var successResponse: (Data?) {
        if case let .success(data: data) = self {
            return data
        }
        return nil
    }
    
    public var failResponse: (Error?) {
        if case let .failure(error: error) = self {
            return error
        }
        return nil
    }
    
    public var urlResponse: (HTTPURLResponse?) {
        if case let .urlResponse(urlResponse: urlResponse) = self {
            return urlResponse
        }
        return nil
    }
}
