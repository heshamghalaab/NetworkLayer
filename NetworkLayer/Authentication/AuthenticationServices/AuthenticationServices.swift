//
//  AuthenticationServices.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

class AuthenticationServices {
    
    func login(with package: LoginPackage, completion: @escaping (_ result: Result<LoginResponse>) -> ()){
        guard let url = package.url else { return}
        RequestManager().request(url: url, method: .post, parameters: package.asDictionary(), headers: package.headers) { (result: Result<LoginResponse>) in
            completion(result)
        }
    }
}
