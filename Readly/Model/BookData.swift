//
//  BookData.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import Foundation

class BookData: Codable {
    let key: String?
    let title: String?
    let subject: [String]?
    let coverId: Int?
    let year: Int?
    var authors: [String]?
    let firstSentence: [String]?
    let ratingsAverage: Double?
    let wantToReadCount: Int?
    let currentlyReadingCount: Int?
    let alreadyReadCount: Int?
    var isFavourite: Bool {
        get {
            return UserDefaults.standard.existingBookIndex(self) != nil
        }
        set { }
    }
    
    enum CodingKeys: String, CodingKey {
        case key
        case title
        case subject
        case coverId = "cover_i"
        case year = "first_publish_year"
        case authors = "author_name"
        case firstSentence = "first_sentence"
        case ratingsAverage = "ratings_average"
        case wantToReadCount = "want_to_read_count"
        case currentlyReadingCount = "currently_reading_count"
        case alreadyReadCount = "already_read_count"
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.subject = try container.decodeIfPresent([String].self, forKey: .subject)
        self.coverId = try container.decodeIfPresent(Int.self, forKey: .coverId)
        self.year = try container.decodeIfPresent(Int.self, forKey: .year)
        self.authors = try container.decodeIfPresent([String].self, forKey: .authors)
        self.firstSentence = try container.decodeIfPresent([String].self, forKey: .firstSentence)
        self.ratingsAverage = try container.decodeIfPresent(Double.self, forKey: .ratingsAverage)
        self.wantToReadCount = try container.decodeIfPresent(Int.self, forKey: .wantToReadCount)
        self.currentlyReadingCount = try container.decodeIfPresent(Int.self, forKey: .currentlyReadingCount)
        self.alreadyReadCount = try container.decodeIfPresent(Int.self, forKey: .alreadyReadCount)
    }
}
