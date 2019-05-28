//
//  EndPointType.swift
//  OneFiMovies
//
//    Created by Perfect Aduh on 07/05/2019.
//  Copyright © 2019 GritWise Solutions. All rights reserved.
//

import Foundation
import UIKit

protocol EndPointype {
    
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
