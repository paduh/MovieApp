//
//  MovieEndPoint.swift
//  OneFiMovies
//
//  Created by user on 28/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    
    case development
    case staging
    case production
}

public enum MovieApi {
    case search(title: String)
}

extension MovieApi: EndPointype {
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    //http://www.omdbapi.com/?apikey=1fe468b0&t=[MOVIETITLE]&y=[MOVIE-YEAR]
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return Constanst.baseUrl
        case .staging: return ""
        case .development: return ""
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }

    var path: String {
        switch self {
        case .search(_):
            return "/"
        }
    }
//http://www.omdbapi.com/?apikey=1fe468b0&t=[MOVIETITLE]&y=[MOVIE-YEAR]
    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .search(let title):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding,
                                          urlParameters: ["apikey": Constanst.apiKey,
                                                          "s":title])
        }
    }
}

