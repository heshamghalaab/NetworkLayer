//
//  RequestManager.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    typealias Completion<T> = (Result<T>) -> ()
    
    func request<T: Decodable>(url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String]?, completion: @escaping Completion<T>) {
        
        printRequestDetails(url: url, method: method, parameters: parameters, headers: headers)
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                
                let _ = response.response?.statusCode
                //print(response)
                switch response.result{
                case .success(_):
                    self.handleSuccess(response: response, completion: completion)
                    
                case .failure(let error):
                    let responseError = error.localizedDescription
                    print("😡 Failure \(responseError)")
                    self.handleFailure(response: response, responseError: responseError, completion: completion)
                }
        }
    }
    
    private func handleSuccess<T: Decodable>(response: DataResponse<Any>, completion: @escaping Completion<T>) {
        
        guard let _data = response.data else {
            completion(.failure("error occured while handling data, please try again later"))
            return
        }
        
        do{
            
            let data = try JSONDecoder().decode(T.self, from: _data)
            //print(data)
            completion(.success(data))
            
        } catch{
            print("----------------")
            print(error)
            completion(.failure("error in decoding, please try again later"))
        }
    }
    
    private func handleFailure<T: Decodable>(response: DataResponse<Any>, responseError: String, completion: @escaping Completion<T>) {
        guard let _data = response.data else {
            completion(.failure(responseError))
            return
        }
        
        do{
            let data = try JSONDecoder().decode(DefaultResponse.self, from: _data)
            completion(.failure(data.message))
            
        } catch{
            completion(.failure(responseError))
        }
    }
    
    private func printRequestDetails(url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String]?){
        print("\n***************************** // *****************************")
        print("✊ \(method) With URL: \(url)")
        if let keys = headers?.keys{ print("✊ Headers: \(keys)") } else { print("✊ No Headers")}
        if let para = parameters{ print("✊ Parameters: \(para)") } else { print("✊ No Parameters")}
        print("***************************** // *****************************\n")
    }
}

