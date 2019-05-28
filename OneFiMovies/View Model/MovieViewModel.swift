//
//  MovieViewModel.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 28/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    fileprivate let networkManager: NetworkManager!
    var movies = [Movie(title: "", year: "", poster: "", director: "")]
    var reload:(() -> ())?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getMovies(title: String) {
        
        networkManager.getMovies(title: title) { [weak self] (movies, error) in
            
            guard let strongSelf = self else { return }
            guard let movies = movies  else { return }
            strongSelf.movies.append(contentsOf: movies.movies)
            strongSelf.reload?()
        }
    }
}
