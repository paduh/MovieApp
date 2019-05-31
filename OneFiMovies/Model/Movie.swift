//
//  Movie.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation


struct Movie: Codable {

    let title: String
    let year: String
    let poster: String
    var director: String?


    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case director = "Director"
    }
}

extension Movie: Equatable {
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title &&
            lhs.director == rhs.director &&
            lhs.poster == rhs.poster &&
            lhs.year == rhs.year
    }
}

struct MovieResponse: Codable {
    
    let response: String
    let totalResults: String
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        
        case response = "Response"
        case totalResults
        case movies = "Search"
    }
}


extension MovieResponse: Equatable {
    
    static func ==(lhs: MovieResponse, rhs: MovieResponse) -> Bool {
        return lhs.response == rhs.response &&
            lhs.totalResults == rhs.totalResults &&
            lhs.movies == rhs.movies
    }
}
