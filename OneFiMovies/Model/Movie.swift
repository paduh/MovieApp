//
//  Movie.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 07/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation


struct Movie: Codable {

    let title: String
    let year: String
    let poster: String
    var director: String?
    var writer: String?
    var genre: String?


    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case director = "Director"
        case writer = "Writer"
        case genre = "Genre"
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
