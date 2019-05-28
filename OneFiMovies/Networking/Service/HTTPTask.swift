//
//  HTTPTask.swift
//  OneFiMovies
//
//    Created by Perfect Aduh on 07/05/2019.
//  Copyright © 2019 GritWise Solutions. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
