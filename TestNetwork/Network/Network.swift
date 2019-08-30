//
//  Network.swift
//  TestNetwork
//
//  Created by Praks on 8/30/19.
//  Copyright © 2019 Praks. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import PSNetwork

class Network: RxNetworking {
    
    static func dataTask(with request: URLRequest) -> Observable<RxNetworkResponse?> {
        
        print("""
            Request method :\(String(describing: request.httpMethod))
            Request url :\(String(describing: request.url?.absoluteString))
            Request headers :\(String(describing: request.allHTTPHeaderFields))"
            """)
        
        if let bodyData = request.httpBody {
            print("Request body :\(Utils.serializeJSON(data: bodyData) as? [String: Any])")
            
        }
        
        
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print("RxNetworking shared.dataTask called")
                
                if let urlResponse = response as? HTTPURLResponse {
                    if let data = data {
                        observer.onNext(.urlResponse(urlResponse: urlResponse))
                        observer.onNext(.success(data: data))
                        observer.onCompleted()
                    }
                } else {
                    print("RxNetworking : NO DATA")
                }
                
                
                // Send error
                if let error = error {
                    print("RXNetworking there is an error :\(error.localizedDescription)")
                    observer.onNext(.failure(error: error))
                    observer.onCompleted()
                }
            }
            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
