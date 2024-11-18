//
//  BookDetailsViewController.swift
//  Readly
//
//  Created by Sphoorti Patil on 14/11/24.
//

import UIKit

class BookDetailsViewController: UIViewController {
    private let bookDetailsVM = BookDetailsViewModel()
    private var bookData: BookData? = nil
    private let bookTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookDetailsImageTableViewCell.self, forCellReuseIdentifier: "BookDetailsImageCell")
        tableView.register(BookDetailsDescriptionTableViewCell.self, forCellReuseIdentifier: "BookDetailsCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    private var bookDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBoookTableView()
    }
    
    private func configureBoookTableView() {
        view.addSubview(bookTableView)
        
        bookTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bookTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bookTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bookTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bookTableView.delegate = self
        bookTableView.dataSource = self
    }
    
    func setBookData(_ bookData: BookData) {
        self.bookData = bookData
        guard let bookKey  = bookData.key else { return }
        bookDetailsVM.fetchBookDetails(bookKey: bookKey) {
                result in
                    switch result {
                    case .success(let bookDetails):
                        DispatchQueue.main.async {
                            self.bookDescription = bookDetails.description?.value
                            self.bookTableView.reloadData()
                        }
                    case .failure(let error):
                        print("ERROR: \(error)")
                    }
                }
        }
}

extension BookDetailsViewController: UITableViewDelegate {}

extension BookDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = bookTableView.dequeueReusableCell(withIdentifier: "BookDetailsImageCell", for: indexPath) as? BookDetailsImageTableViewCell else {
                return UITableViewCell(frame: .zero)
            }
            cell.setImageandTitle(coverId: bookData?.coverId, title: bookData?.title)
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let cell = bookTableView.dequeueReusableCell(withIdentifier: "BookDetailsCell", for: indexPath) as? BookDetailsDescriptionTableViewCell else {
                return UITableViewCell(frame: .zero)
            }
            cell.setData(bookDescription: bookDescription)
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell(frame: .zero)
        }
    }
}
