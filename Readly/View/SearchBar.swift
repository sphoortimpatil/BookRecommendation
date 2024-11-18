//
//  SearchBar.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

protocol SearchBarDelegate: AnyObject {
    func onSearchTap(searchValue: String)
}

import UIKit

class SearchBar: UIView {
    weak var delegate: SearchBarDelegate?
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Enter Book Title"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.leftView?.tintColor = .red
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.barTintColor = .red
        searchBar.tintColor = .red
        searchBar.returnKeyType = .search
        searchBar.keyboardType = .default
        searchBar.becomeFirstResponder()
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSearchBar()
        configureDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func configureDelegate() {
        searchBar.delegate = self
    }
    
    func setSelectedSearchText(_ selectedSearchText: String) {
        searchBar.text = selectedSearchText
        searchBar.resignFirstResponder()
    }
    
    func setSearchInteractions(_ isEnabled: Bool, _ searchPlaceHolderText: String) {
        searchBar.searchTextField.isEnabled = isEnabled
        searchBar.text = searchPlaceHolderText
    }
}

extension SearchBar: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        if searchText.isEmpty {
            searchBar.showsCancelButton = false
        }
        delegate?.onSearchTap(searchValue: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        delegate?.onSearchTap(searchValue: "")
    }
}
