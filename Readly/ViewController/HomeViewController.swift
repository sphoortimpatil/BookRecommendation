//
//  HomeViewController..swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import UIKit

class HomeViewController: BooksListViewController {
    private let spinnerView = SpinnerView()
    private let awardWinningBooksVM = AwardWinningBooksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Award Winning Books"

        configureSpinnerView()
        configureNotificationCenter()
        fetchDataUsingNetworkManager()
        awardWinningBooksVM.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        awardWinningBooksVM.setBookListVM()
        self.resetData()
    }
    
    private func configureNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavouriteBooks), name: NSNotification.Name("UpdateFavouriteButton"), object: nil)
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
    
    @objc func updateFavouriteBooks() {
        awardWinningBooksVM.setBookListVM()
        self.resetData()
    }
    
    @objc private func fetchDataUsingNetworkManager() {
        spinnerView.setSpinnerAnimation(true)
        awardWinningBooksVM.fetchAwardWinningBooks()
       }
}

extension HomeViewController: AwardWinningBooksViewModelDelegate {
    func awardWinningBooksFetched(_ awardWinningBooks: [BookData]) {
        DispatchQueue.main.async {
            self.resetData()
        }
        self.spinnerView.setSpinnerAnimation(false)
    }
}
