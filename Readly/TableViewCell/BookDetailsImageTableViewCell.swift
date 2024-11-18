//
//  BookDetailsImageTableViewCell.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import UIKit

class BookDetailsImageTableViewCell: UITableViewCell {
    private let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .systemRed
        label.text = "Book Title"
        return label
    }()
    private let bookView = CoverImage()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureBookTitleLabel()
        configureBookView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureBookTitleLabel() {
        contentView.addSubview(bookTitleLabel)

        bookTitleLabel.topAnchor.constraint(
            equalTo: contentView.topAnchor, constant: 15
        )
        .isActive = true
        bookTitleLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor, constant: 10
        ).isActive = true
        bookTitleLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor
        ).isActive = true
    }
    
    private func configureBookView() {
        contentView.addSubview(bookView)
        bookView.translatesAutoresizingMaskIntoConstraints = false

        bookView.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor).isActive =
            true
        bookView.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor, constant: 0
        ).isActive = true
        bookView.widthAnchor.constraint(
            equalTo: contentView.widthAnchor, multiplier: 0.4
        ).isActive = true
        bookView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        bookView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        bookView.layer.cornerRadius = 10
        bookView.layer.shadowColor = UIColor.black.cgColor
        bookView.layer.shadowOpacity = 0.2
        bookView.layer.shadowOffset = .zero
        bookView.layer.shadowRadius = 12
    }

    func setImageandTitle(coverId: Int?, title: String?) {
        if let title = title {
            bookTitleLabel.text = title
        }
        if let coverId = coverId {
            bookView.setImage("https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")
        }
    }

}
