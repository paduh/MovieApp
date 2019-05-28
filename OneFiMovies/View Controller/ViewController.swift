//
//  ViewController.swift
//  OneFiMovies
//
//  Created by user on 07/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    fileprivate var networkManager: NetworkManager!
    fileprivate var viewModel: MovieViewModel!
 
    required init?(coder aDecoder: NSCoder) {
       
        networkManager = NetworkManager()
        self.viewModel = MovieViewModel(networkManager: networkManager)
         super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        viewModel.getMovies(title: "batman")
    }
}

