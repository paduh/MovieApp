//
//  NetworkRouter.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 28/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()


protocol NetworkRouter {
    
    associatedtype EndPoint: EndPointype
    
    func request(route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
