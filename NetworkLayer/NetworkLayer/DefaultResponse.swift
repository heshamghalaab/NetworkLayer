//
//  DefaultResponse.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

struct DefaultResponse: Decodable {
    var status: Int
    var message: String
}
