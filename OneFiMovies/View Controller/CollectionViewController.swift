//
//  CollectionViewController.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit



class BaseListController: UICollectionViewController {

    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
