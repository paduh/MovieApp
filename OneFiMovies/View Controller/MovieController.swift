//
//  MovieController.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit
import SDWebImage

class MovieController: UIViewController {

    @IBOutlet weak var moviePostImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let movie = movie {
            setupMovie(movie: movie)
            navigationItem.title = movie.title
        }
    }
    
    fileprivate func setupMovie(movie: Movie) {
        titleLbl.text = movie.title
        yearLbl.text = movie.year
        if let url = URL(string: movie.poster)  {
            moviePostImgView.sd_setImage(with: url)
        }
        if movie.director == nil {
            directorLbl.text = Constanst.NA
        }else {
            directorLbl.text = movie.director
        }
    }
}
