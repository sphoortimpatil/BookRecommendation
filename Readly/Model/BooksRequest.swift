//
//  AwardWinningBooksRequest.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

struct BooksRequest: APIRequest {
    let url: String = "https://openlibrary.org/search.json"
    let httpMethod: HTTPRequestMethod = .get
    let headers: [String: String]? = nil
    var parameters: [String: Any]? = ["q": "booker+prize","limit": 20, "details": true]
}
