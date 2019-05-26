//
//  LoginPackage.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

struct LoginPackage: Encodable, DictionaryEncodable{
    
    var url: URL? {
        var components = URLComponent().components
        components.path = "/api/v1/login"
        fatalError("please set the component path")
        return components.url
    }
    
    var headers: [String : String]? {
        return RequestComponent.headerComponent([.contentType])
    }
    
    // all Parameters will be here
    var email: String
    var password: String
}
