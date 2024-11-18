//
//  SearchViewController.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import UIKit

class SearchViewController: BooksListViewController {
    private let spinnerView = SpinnerView()
    private let searchBar = SearchBar()
    private let searchBooksVM = SearchBooksViewModel()
    private let debouncer = Debouncer(delay: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchBar()
        configureSpinnerView()
        searchBooksVM.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        searchBooksVM.setBookListVM()
        self.resetData()
    }
    
    private func configureSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        navigationBar.addSubview(searchBar)

        searchBar.topAnchor.constraint(equalTo: navigationBar.topAnchor)
            .isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchBar.leadingAnchor.constraint(
            equalTo: navigationBar.leadingAnchor, constant: 10
        ).isActive = true
        searchBar.trailingAnchor.constraint(
            equalTo: navigationBar.trailingAnchor, constant: -10
        ).isActive = true
        searchBar.delegate = self
    }
    
    private func configureSpinnerView() {
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinnerView)

        spinnerView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        spinnerView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
        ).isActive = true
    }
    
}

extension SearchViewController: SearchBarDelegate {
    func onSearchTap(searchValue: String) {
        if(searchValue.count <= 2) {
            searchBooksVM.resetSearchedBooks()
            self.resetData()
            return
        }
        spinnerView.setSpinnerAnimation(true)
        debouncer.debounce {
            self.searchBooksVM.fetchBooksByTitle(searchTerm: searchValue)
        }
    }
}

extension SearchViewController: SearchBooksViewModelDelegate {
    func searchedBooksByTitleFetched(_ searchedBooks: [BookData]) {
        DispatchQueue.main.async {
            self.resetData()
        }
        spinnerView.setSpinnerAnimation(false)
    }
    
}
