//
//  DictionaryEncodable.swift
//  NetworkLayer
//
//  Created by hesham ghalaab on 5/26/19.
//  Copyright © 2019 hesham ghalaab. All rights reserved.
//

import Foundation

protocol DictionaryEncodable: Encodable {}

extension DictionaryEncodable {
    func asDictionary() -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        guard let json = try? encoder.encode(self),
            let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else {
                return nil
        }
        return dict
    }
}
