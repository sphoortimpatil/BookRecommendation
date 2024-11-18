//
//  BookListModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import Foundation

class BookListModel: Codable {
    let docs: [BookData]
    
    enum CodingKeys: String, CodingKey {
        case docs
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.docs = try container.decode([BookData].self, forKey: .docs)
    }
}
