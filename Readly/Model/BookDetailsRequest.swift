//
//  BookDetailsRequest.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

struct BookDetailsRequest: APIRequest {
    var url: String = "https://openlibrary.org"
    let httpMethod: HTTPRequestMethod = .get
    let headers: [String: String]? = nil
    var parameters: [String: Any]? = nil
    
    init(bookKey: String) {
        url += "\(bookKey).json"
    }
}
