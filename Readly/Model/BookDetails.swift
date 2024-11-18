//
//  BookDetails.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import Foundation

class BookDetails: Codable {
    let description: BookDescription?
    
    enum CodingKeys: String, CodingKey {
        case description
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decodeIfPresent(BookDescription.self, forKey: .description)
    }
}
