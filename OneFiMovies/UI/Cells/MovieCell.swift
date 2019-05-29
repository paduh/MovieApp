//
//  MovieCell.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePostImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!

    var movie: Movie! {
        didSet {
            setupCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setupCell() {
        if let url = URL(string: movie.poster) {
            moviePostImgView.sd_setImage(with: url)
        }
        titleLbl.text = movie.title
        yearLbl.text = movie.year
        
        if movie.director == nil {
            directorLbl.text = Constanst.NA
        }else {
            directorLbl.text = movie.director
        }
    }
}
