//
//  Utils.swift
//  Eforex
//
//  Created by Rowin Shahi on 21/12/2017.
//  Copyright © 2017 Eightsquare Pvt. Ltd. All rights reserved.
//

import UIKit

public struct Utils {
    //MARK: Serialize JSON
    public static func serializeJSON(data: Data) -> AnyObject {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            return json as AnyObject
        } catch let error as NSError {
            
            print("JSONSerialization error:\(error.localizedDescription)")
            return [:] as AnyObject
        }
    }
    
    public static func decodeJSON<jsonCodable>(type: jsonCodable.Type, from data: Data) -> AnyObject where jsonCodable: Decodable {
        do {
            let decoder = JSONDecoder()
            let parsedData = try decoder.decode(type, from: data)
            return parsedData as AnyObject
        }
            //decodeJSON
        catch let err {
            print("Err", err)
            return [:] as AnyObject
        }
        
    }
}
