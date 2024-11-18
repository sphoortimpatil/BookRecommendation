//
//  BookDetailsViewModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import Foundation

class BookDetailsViewModel {
    private let networkManager = NetworkManager()
    
    func fetchBookDetails(bookKey: String, completionHandler: @escaping(Result<BookDetails, APIRequestError>) -> Void) {
        let bookDetailsRequest = BookDetailsRequest(bookKey: bookKey)
        networkManager.fetchApiData(from: bookDetailsRequest, completionHandler: completionHandler)
    }
}
