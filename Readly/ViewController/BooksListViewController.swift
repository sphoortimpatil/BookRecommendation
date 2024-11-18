//
//  BooksListViewController.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import UIKit

class BooksListViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    private var bookList: [BookData] = []
    private var bookListVM = BookListViewModel.shared
    private var isFavouriteButtonVisible: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func resetData() {
        tableView.reloadData()
    }
    
    func setFavouriteButtonVisibility(_ isVisible: Bool) {
        isFavouriteButtonVisible = isVisible

    }

}

// MARK: - TableViewMethods
extension BooksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListVM.getBookList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell(frame: .zero) }
        cell.selectionStyle = .none
        cell.setData(bookData: bookListVM.getBookList()[indexPath.row], indexPathRow: indexPath.row)
        cell.delegate = self
        cell.setFavouriteButtonVisibility(isFavouriteButtonVisible)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookDetailsVC = BookDetailsViewController()
        bookDetailsVC.setBookData(bookListVM.getBookList()[indexPath.row])
        navigationController?.present(bookDetailsVC, animated: true)
    }
}

extension BooksListViewController: UITableViewDelegate {}

extension BooksListViewController: BookTableViewCellDelegate {
    @objc func isMarkedFavouriteAt(_ indexPathRow: Int) {
        let isFavorite = bookListVM.getBookList()[indexPathRow].isFavourite
        if let cell = tableView.cellForRow(at: IndexPath(row: indexPathRow, section: 0)) as? BookTableViewCell {
            cell.animateFavouriteSelection(!isFavorite)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.bookListVM.updateIsFavourite(indexPathRow)
            UserDefaults.standard.saveFavouriteBooks(self.bookListVM.getBookList()[indexPathRow])
        }
    }
}
