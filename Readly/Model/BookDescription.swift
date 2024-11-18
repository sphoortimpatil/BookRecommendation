//
//  BookDescription.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import Foundation

class BookDescription: Codable {
    let value: String?
    
    enum CodingKeys: String, CodingKey {
        case value
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decodeIfPresent(String.self, forKey: .value)
    }
    
}
