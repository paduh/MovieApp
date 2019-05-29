//
//  UIViewController + Extension.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit


extension UIViewController {
    
    static func instantiateFromStoryboard(entry: StoryboardEntry = .Main) -> Self? {
        func instanceFromStoryboard<T: UIViewController>() -> T? {
            return UIStoryboard(name: entry.rawValue, bundle: nil).instantiateViewController(withIdentifier: "\(self)") as? T
        }
        return instanceFromStoryboard()
    }
}
