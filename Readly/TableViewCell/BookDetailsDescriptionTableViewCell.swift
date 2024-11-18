//
//  BookDetailsImageTableViewCell.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import UIKit

class BookDetailsDescriptionTableViewCell: UITableViewCell {
    private let bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureScrollViewAndDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureScrollViewAndDescriptionLabel() {
        contentView.addSubview(bookDescriptionLabel)
        
        bookDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
            .isActive = true
        bookDescriptionLabel.leadingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10
        ).isActive = true
        bookDescriptionLabel.trailingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10
        ).isActive = true
        bookDescriptionLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor
        ).isActive = true
    }

    func setData(bookDescription: String?) {
        if let bookDescription = bookDescription {
            bookDescriptionLabel.text = bookDescription
        }
    }
}
