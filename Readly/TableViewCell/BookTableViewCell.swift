//
//  BookTableViewCell.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import UIKit

protocol BookTableViewCellDelegate: AnyObject {
    func isMarkedFavouriteAt(_ indexPathRow: Int)
}

class BookTableViewCell: UITableViewCell {
    weak var delegate : BookTableViewCellDelegate?
    private var indexPathRow: Int = 0
    private let coverImageView = CoverImage()
    private let bookDataView = UIView()
    private let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .systemRed
        label.text = "Book Title"
        return label
    }()
    private let bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.text = "Book Author"
        return label
    }()
    private let bookGenerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textColor = .label
        label.numberOfLines = 2
        label.text =
            "Book Gener, Book Gener, Book Gener, Book Gener, Book Gener"
        return label
    }()
    private let bookYearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "Book Year"
        return label
    }()
    private let bookRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "3.5 / 5"
        return label
    }()
    private let currentlyReadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .subheadline).pointSize,
            weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "Currently Reading: 5"
        return label
    }()
    private var favouriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var filledHeartImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(systemName: "heart.fill")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .clear
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureBookView()
        confgureBookDataView()
        configureLabel()
        configureFavouriteButton()
        configureFavouriteButtomImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureBookView() {
        contentView.addSubview(coverImageView)
        coverImageView.translatesAutoresizingMaskIntoConstraints = false

        coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive =
            true
        coverImageView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor, constant: 10
        ).isActive = true
        coverImageView.widthAnchor.constraint(
            equalTo: contentView.widthAnchor, multiplier: 0.4
        ).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        coverImageView.layer.cornerRadius = 10
        coverImageView.layer.shadowColor = UIColor.black.cgColor
        coverImageView.layer.shadowOpacity = 0.2
        coverImageView.layer.shadowOffset = .zero
        coverImageView.layer.shadowRadius = 12
    }

    private func confgureBookDataView() {
        bookDataView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(bookDataView)

        bookDataView.topAnchor.constraint(equalTo: contentView.topAnchor)
            .isActive = true
        bookDataView.leadingAnchor.constraint(
            equalTo: coverImageView.trailingAnchor, constant: 20
        ).isActive = true
        bookDataView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -10
        ).isActive = true
        bookDataView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
    }

    private func configureLabel() {
        configureBookTitleLabel()
        configureAuthorLabel()
        configureGenreLabel()
        configureYearAndRatingLabel()
        configureCurrentlyReadingLabel()
    }

    private func configureBookTitleLabel() {
        bookDataView.addSubview(bookTitleLabel)

        bookTitleLabel.topAnchor.constraint(
            equalTo: bookDataView.topAnchor, constant: 15
        )
        .isActive = true
        bookTitleLabel.leadingAnchor.constraint(
            equalTo: bookDataView.leadingAnchor
        ).isActive = true
        bookTitleLabel.trailingAnchor.constraint(
            equalTo: bookDataView.trailingAnchor
        ).isActive = true
    }

    private func configureAuthorLabel() {
        bookDataView.addSubview(bookAuthorLabel)

        bookAuthorLabel.topAnchor.constraint(
            equalTo: bookTitleLabel.bottomAnchor, constant: -5
        ).isActive = true
        bookAuthorLabel.leadingAnchor.constraint(
            equalTo: bookDataView.leadingAnchor
        ).isActive = true
        bookAuthorLabel.trailingAnchor.constraint(
            equalTo: bookDataView.trailingAnchor
        ).isActive = true
    }

    private func configureGenreLabel() {
        bookDataView.addSubview(bookGenerLabel)
        bookGenerLabel.topAnchor.constraint(
            equalTo: bookAuthorLabel.bottomAnchor, constant: 10
        ).isActive = true
        bookGenerLabel.leadingAnchor.constraint(
            equalTo: bookDataView.leadingAnchor
        ).isActive = true
        bookGenerLabel.trailingAnchor.constraint(
            equalTo: bookDataView.trailingAnchor
        ).isActive = true
    }

    private func configureYearAndRatingLabel() {
        bookDataView.addSubview(bookYearLabel)

        bookYearLabel.topAnchor.constraint(
            equalTo: bookGenerLabel.bottomAnchor, constant: 20
        ).isActive = true
        bookYearLabel.leadingAnchor.constraint(
            equalTo: bookDataView.leadingAnchor
        ).isActive = true
        bookYearLabel.widthAnchor.constraint(
            equalTo: bookDataView.widthAnchor, multiplier: 0.5, constant: -5
        ).isActive = true

        bookDataView.addSubview(bookRatingLabel)

        bookRatingLabel.topAnchor.constraint(
            equalTo: bookGenerLabel.bottomAnchor, constant: 20
        ).isActive = true
        bookRatingLabel.leadingAnchor.constraint(
            equalTo: bookYearLabel.trailingAnchor, constant: 10
        ).isActive = true
        bookRatingLabel.widthAnchor.constraint(
            equalTo: bookDataView.widthAnchor, multiplier: 0.5, constant: -5
        ).isActive = true
    }

    private func configureCurrentlyReadingLabel() {
        bookDataView.addSubview(currentlyReadingLabel)

        currentlyReadingLabel.topAnchor.constraint(
            equalTo: bookYearLabel.bottomAnchor, constant: 20
        ).isActive = true
        currentlyReadingLabel.leadingAnchor.constraint(
            equalTo: bookDataView.leadingAnchor
        ).isActive = true
    }
   
    private func configureFavouriteButton() {
        bookDataView.addSubview(favouriteButton)

        favouriteButton.heightAnchor.constraint(equalToConstant: 20).isActive =
            true
        favouriteButton.widthAnchor.constraint(equalToConstant: 22).isActive =
            true
        favouriteButton.bottomAnchor.constraint(
            equalTo: bookDataView.bottomAnchor, constant: -15
        ).isActive = true
        favouriteButton.trailingAnchor.constraint(
            equalTo: bookDataView.trailingAnchor, constant: -10
        ).isActive = true
        favouriteButton.addTarget(
            self, action: #selector(onFavouriteButtonTapped),
            for: .touchUpInside)
    }
    
    private func configureFavouriteButtomImage() {
        favouriteButton.addSubview(filledHeartImageView)
        favouriteButton.bringSubviewToFront(filledHeartImageView)
    }

    @objc private func onFavouriteButtonTapped() {
        delegate?.isMarkedFavouriteAt(self.indexPathRow)
    }
    
    private func setButtonIcon(_ isFavourite: Bool) {
        let heartImage = isFavourite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        let tintColor: UIColor = isFavourite ? .systemRed : .systemGray
        filledHeartImageView.image = heartImage
        filledHeartImageView.tintColor = tintColor
    }
    
    func animateFavouriteSelection(_ isFavourite: Bool) {
        setButtonIcon(isFavourite)
        let maskLayer = CALayer()
        maskLayer.frame = favouriteButton.frame
        maskLayer.backgroundColor = UIColor.black.cgColor
        filledHeartImageView.layer.mask = maskLayer
        
        maskLayer.bounds = CGRect(x: 0, y: 0, width: filledHeartImageView.bounds.width, height: 0)
        maskLayer.position = CGPoint(x: filledHeartImageView.bounds.width / 2 , y: filledHeartImageView.bounds.height)
        
        let heightAnimation = CABasicAnimation(keyPath: "bounds.size.height")
        heightAnimation.fromValue = 0
        heightAnimation.toValue = filledHeartImageView.bounds.height
        heightAnimation.duration = 0.5
        heightAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        heightAnimation.fillMode = .forwards
        
        let positionAnimation = CABasicAnimation(keyPath: "position.y")
        positionAnimation.fromValue = filledHeartImageView.bounds.height
        positionAnimation.toValue = filledHeartImageView.bounds.height / 2
        positionAnimation.duration = 0.5
        positionAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        positionAnimation.fillMode = .forwards
        
        maskLayer.add(heightAnimation, forKey: "fillAnimation")
        maskLayer.add(positionAnimation, forKey: "positionAnimation")
        
        maskLayer.bounds.size.height = filledHeartImageView.bounds.height
        maskLayer.position.y = filledHeartImageView.bounds.height / 2
    }
    
    func setData(bookData: BookData, indexPathRow: Int) {
        setButtonIcon(bookData.isFavourite)
        self.indexPathRow = indexPathRow
        self.bookTitleLabel.text = bookData.title
        self.bookGenerLabel.text = bookData.subject?.joined(separator: ", ")
        self.bookAuthorLabel.text = bookData.authors?.joined(separator: ", ")
        self.bookYearLabel.text =
            bookData.year != nil ? "\(bookData.year!)" : "Unknown"
        self.bookRatingLabel.text =
            bookData.ratingsAverage != nil
            ? "\(bookData.ratingsAverage!.rounded()) / 5" : "Unknown"
        self.currentlyReadingLabel.text =
            "Currently Reading: \(bookData.currentlyReadingCount ?? 0)"
        if let coverId = bookData.coverId {
            coverImageView.setImage("https://covers.openlibrary.org/b/id/\(coverId)-M.jpg")
        } else {
            coverImageView.resetImage()
        }
    }
    
    func setFavouriteButtonVisibility(_ isVisible: Bool) {
        favouriteButton.isHidden = !isVisible
    }

}
