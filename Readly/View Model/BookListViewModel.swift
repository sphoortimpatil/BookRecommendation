//
//  BookListViewModel.swift
//  Readly
//
//  Created by Sphoorti Patil on 17/11/24.
//

class BookListViewModel {
    static let shared = BookListViewModel()
       
    private init() {}
    
    private var bookList: [BookData] = []
    
    func setBookList(_ bookList: [BookData]) {
        self.bookList = bookList
    }
    
    func getBookList() -> [BookData] {
        return bookList
    }
    
    func updateIsFavourite(_ indexPathRow: Int) {
        bookList[indexPathRow].isFavourite.toggle()
    }
}
