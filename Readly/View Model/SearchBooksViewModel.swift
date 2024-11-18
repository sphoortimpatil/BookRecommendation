//
//  SearchBooksViewModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 13/11/24.
//

import Foundation

protocol SearchBooksViewModelDelegate: AnyObject {
    func searchedBooksByTitleFetched(_ searchedBooks: [BookData])
}

class SearchBooksViewModel {
    weak var delegate: SearchBooksViewModelDelegate?
    private let networkManager = NetworkManager()
    private var searchedBooks: [BookData] = []
    private let bookListVM = BookListViewModel.shared
    
    func fetchBooksByTitle(searchTerm: String) {
        let searchBooksRequest = SearchBookRequest(searchParameter: searchTerm)
        networkManager.fetchApiData(from: searchBooksRequest) {
        [weak self] (result: Result<BookListModel, APIRequestError>) in
            switch result {
               case .success(let bookListData):
                    self?.searchedBooks = bookListData.docs
                    self?.setBookListVM()
                    self?.delegate?.searchedBooksByTitleFetched(bookListData.docs)
               case .failure(let error):
                    print("Error \(error)")
                    self?.searchedBooks = []
                    self?.setBookListVM()
                    self?.delegate?.searchedBooksByTitleFetched([])
               }
           }
    }
    
    func resetSearchedBooks() {
        self.searchedBooks = []
        setBookListVM()
    }
    
    func setBookListVM() {
        bookListVM.setBookList(self.searchedBooks)
    }
}
