//
//  FavoriteViewController.swift
//  Readly
//
//  Created by Sphoorti Patil on 11/11/24.
//

import UIKit

class FavoriteViewController: BooksListViewController {
    private let favouriteViewModel = FavouriteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Favourites"
        getFavouriteBooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getFavouriteBooks()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("UpdateFavouriteButton"), object: nil)
    }

    @objc private func getFavouriteBooks() {
        favouriteViewModel.setBookListVM()
        self.resetData()
    }
    
    override func isMarkedFavouriteAt(_ indexPathRow: Int) {
        super.isMarkedFavouriteAt(indexPathRow)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               self.getFavouriteBooks()
        }
    }
    
}
