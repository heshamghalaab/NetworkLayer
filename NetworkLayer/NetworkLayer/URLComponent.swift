//
//  URLComponent.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

struct URLComponent{
    var components: URLComponents{
        var component = URLComponents()
        component.scheme = "https"
        component.host = ""
        fatalError("please set the component scheme and host")
        return component
    }
}
