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
    var movies = [Movie]()
    var movie = Movie(title: "", year: "", poster: "", director: "", writer: "", genre: "")
    var reload:(() -> ())?
    var currentPage: Int = 1
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getMoviesTitlePageSearch(title: String, page: Int) {
        
        networkManager.getMoviesPageSearch(title: title, page: page) { [weak self] (movies, error) in
            
            guard let strongSelf = self else { return }
            guard let movies = movies  else { return }
            strongSelf.movies.append(contentsOf: movies.movies)
            strongSelf.reload?()
        }
    }
}
