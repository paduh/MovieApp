//
//  MovieController.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 07/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit

class MovieController: BaseListController {
    
    
    fileprivate var networkManager: NetworkManager!
    fileprivate var viewModel: MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // TODO Use dependecy injection to make this class testable, setup initializer
        networkManager = NetworkManager()
        self.viewModel = MovieViewModel(networkManager: networkManager)
        
        viewModel.getMovies(title: "batman", page: 4)
        
        collectionView.backgroundColor = .white
        collectionView.register(MovieCell.self)
        
        viewModel.reload = { [weak self] in
            guard  let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(MovieCell.self, for: indexPath)
        cell.movie = viewModel.movies[indexPath.row]
        return cell
    }
}

extension MovieController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.movies.count - 1 {  //numberofitem count
            loadMoreMovies()
        }
    }
    
    func loadMoreMovies(){
        //requests another set of data (10 more items) from the API.
        viewModel.currentPage += 1
        viewModel.getMovies(title: "batman", page: viewModel.currentPage)
    }
}
