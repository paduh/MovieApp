//
//  UITableView + Extension.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit


extension UITableView {
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let reuseId = reuseIdentifier ?? "\(T.self)"
        self.register(UINib(nibName: reuseId, bundle: Bundle.main), forCellReuseIdentifier: reuseId)
    }
    
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath? = nil) -> T {
        
        
        if let indexPath = indexPath {
            guard
                let cell = dequeueReusableCell(withIdentifier: String(describing: T.self),
                                               for: indexPath) as? T
                else { fatalError("Could not dequeue cell with type \(T.self)") }
            return cell
            
        }
        
        /// In case we're dealing with section Headers. They don't need a special headerClass cell...
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T
            else { fatalError("Could not dequeue header cell with type \(T.self)") }
        return cell
    }
}
