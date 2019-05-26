//
//  Result.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

// By making our result type generic, it can easily be reused in many different contexts, while still retaining full type safety
enum Result<T> {
    case success(T)
    case failure(String)
}
