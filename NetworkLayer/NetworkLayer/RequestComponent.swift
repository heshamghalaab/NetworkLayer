//
//  RequestComponent.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

class RequestComponent{
    
    enum Component {
        case contentType
        case accept
        case authorization
        case lang
    }
    
    class func headerComponent(_ component: [Component]) -> [String: String]{
        var header = [String: String]()
        for singleComponent in component{
            switch singleComponent{
            case .contentType:
                header["Content-Type"] = "application/json"
            case .accept:
                header["Accept"] = "application/json"
            case .authorization:
                //if Defaults.isUserLogged{
                    header["Authorization"] = "Bearer " // + Defaults.token
                //}
            case .lang:
                header["lang"] = "en"
            }
        }
        return header
    }
}
