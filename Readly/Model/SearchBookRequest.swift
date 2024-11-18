//
//  SearchBookRequest.swift
//  Readly
//
//  Created by Sphoorti Patil on 13/11/24.
//


struct SearchBookRequest: APIRequest {
    var searchParameter: String
    let url: String = "https://openlibrary.org/search.json"
    let httpMethod: HTTPRequestMethod = .get
    let headers: [String: String]? = nil
    var parameters: [String: Any]?
    
    init(searchParameter: String) {
        self.searchParameter = searchParameter
        self.parameters = ["title": searchParameter,"limit": 10, "details": true]
    }
}
