//
//  APIService.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 07/05/2019.
//  Copyright © 2019 GritWise Solutions. All rights reserved.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    
//    func fetchMovies(searchTerm: String, completion: @escaping (Result<Any, Error>) ->()) {
//        
//        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                print("Could nto fectch json", err)
//                //completion(err)
//                return
//            }
//            
//            guard let data = data else { return }
//            do {
//                let searchResult = try JSONDecoder().decode(Movie.self, from: data)
//               // searchResult.results.forEach({print($0.averageUserRating)})
//              //  completion(searchResult.results)
//            }catch let jsonErr {
//                print("Could nto decode json", jsonErr)
//               // completion(nil, jsonErr)
//            }
//            }.resume()
//    }
}
