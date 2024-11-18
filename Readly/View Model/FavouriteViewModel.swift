//
//  FavouriteViewModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 17/11/24.
//

import Foundation

class FavouriteViewModel {
    private let bookListVM = BookListViewModel.shared
    
    func setBookListVM() {
        let decodedData = UserDefaults.standard.retrieveFavouriteBooks()
        bookListVM.setBookList(decodedData)
    }
    
}
