//
//  AwardWinningBooksViewModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import Foundation

protocol AwardWinningBooksViewModelDelegate: AnyObject {
    func awardWinningBooksFetched(_ awardWinningBooks: [BookData])
}

class AwardWinningBooksViewModel {
    weak var delegate: AwardWinningBooksViewModelDelegate?
    private let networkManager = NetworkManager()
    private var awardWinningBooks: [BookData] = []
    private let bookListVM = BookListViewModel.shared
    
    func fetchAwardWinningBooks() {
        let booksRequest = BooksRequest()
        networkManager.fetchApiData(from: booksRequest) {
        [weak self] (result: Result<BookListModel, APIRequestError>) in
            switch result {
               case .success(let bookListData):
                    self?.awardWinningBooks = bookListData.docs
                    self?.bookListVM.setBookList(bookListData.docs)
                    self?.delegate?.awardWinningBooksFetched(bookListData.docs)
               case .failure(let error):
                    print("Error \(error)")
                    self?.awardWinningBooks = []
                    self?.bookListVM.setBookList([])
                    self?.delegate?.awardWinningBooksFetched([])
               }
           }
    }
    
    func setBookListVM() {
        bookListVM.setBookList(self.awardWinningBooks)
    }
}
