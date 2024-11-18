//
//  CoverImage.swift
//  Readly
//
//  Created by Sphoorti Patil on 15/11/24.
//

import UIKit

class CoverImage: UIView {
    private let spinnerView = SpinnerView()
    private var currentTask: URLSessionDataTask?
    private let bookView = UIView()
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ImagePlaceholder")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBookView()
        configureBookImageView()
        configureSpinnerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBookView() {
        self.addSubview(bookView)
        bookView.translatesAutoresizingMaskIntoConstraints = false

        bookView.topAnchor.constraint(equalTo: self.topAnchor).isActive =
            true
        bookView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        bookView.widthAnchor.constraint(
            equalTo: self.widthAnchor).isActive = true
        bookView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            .isActive = true
    }

    private func configureBookImageView() {
        bookView.addSubview(bookImageView)

        bookImageView.heightAnchor.constraint(
            equalTo: bookView.heightAnchor, constant: -30
        ).isActive = true
        bookImageView.centerYAnchor.constraint(equalTo: bookView.centerYAnchor)
            .isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: bookView.leadingAnchor)
            .isActive = true
        bookImageView.widthAnchor.constraint(equalTo: bookView.widthAnchor)
            .isActive = true
    }
    
    private func configureSpinnerView() {
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.addSubview(spinnerView)

        spinnerView.centerXAnchor.constraint(
            equalTo: bookImageView.centerXAnchor
        ).isActive = true
        spinnerView.bottomAnchor.constraint(
            equalTo: bookImageView.bottomAnchor, constant: -20
        ).isActive = true
    }
    
    func resetImage() {
        bookImageView.image = UIImage(named: "ImagePlaceholder")
        setNeedsLayout()
    }
    
    func setImage(_ imageUrl: String) {
        spinnerView.setSpinnerAnimation(true)
        bookImageView.image = UIImage(named: "ImagePlaceholder")
        
        currentTask?.cancel()
        bookImageView.asyncLoadImage(imageUrl: imageUrl) {
            [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.bookImageView.image = UIImage(data: data)
                }
                self.spinnerView.setSpinnerAnimation(false)
            case .failure(let error):
                print("Error in loading Image", error)
                self.spinnerView.setSpinnerAnimation(false)
                DispatchQueue.main.async {
                }
            }
        }
    }
}
