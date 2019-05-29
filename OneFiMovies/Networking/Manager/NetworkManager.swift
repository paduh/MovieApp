//
//  NetworkManager.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 28/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation


import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    let router = Router<MovieApi>()
    
    
    //TODO Implement this using Generic to avoid code duplicaiton
    func getMoviesPageSearch(title: String, page: Int, completion: @escaping (_ movie: MovieResponse?,_ error: String?)->()){
        router.request(route: .titlePageSearch(title: title, page: page)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print("Res\(responseData)")
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print("Json\(jsonData)")
                        let apiResponse = try JSONDecoder().decode(MovieResponse.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
