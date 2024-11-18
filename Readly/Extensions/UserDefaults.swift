//
//  UserDefaults.swift
//  Readly
//
//  Created by Sphoorti Patil on 13/11/24.
//

import Foundation
extension UserDefaults {
    private static let favouritesKey = "FavouriteList"
    
    func saveFavouriteBooks(_ books: BookData) {
        var savedFavouriteList = UserDefaults.standard.array(forKey: UserDefaults.favouritesKey) as? [Data] ?? []
        
        if let existingIndex = existingBookIndex(books) {
            savedFavouriteList.remove(at: existingIndex)
        } else {
            let encoder = JSONEncoder()
            guard let encodedBooksData = try? encoder.encode(books) else { return }
            savedFavouriteList.append(encodedBooksData)
        }
        UserDefaults.standard.set(savedFavouriteList, forKey: UserDefaults.favouritesKey)
    }
    
    func retrieveFavouriteBooks() -> [BookData] {
        let decoder = JSONDecoder()
        guard let savedFavouriteList = UserDefaults.standard.array(forKey: UserDefaults.favouritesKey) as? [Data] else {
            return []
        }
               
        let decodedData = savedFavouriteList.compactMap { encodedData in
            try? decoder.decode(BookData.self, from: encodedData)
        }
        return decodedData
    }
    
     func existingBookIndex(_ book: BookData) -> Int? {
        let decodedData = retrieveFavouriteBooks()
        for (index, decodedBook) in decodedData.enumerated() {
            if decodedBook.key == book.key {
                return index
            }
        }
        return nil
    }
}
