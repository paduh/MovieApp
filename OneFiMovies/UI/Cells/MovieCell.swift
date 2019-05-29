//
//  MovieCell.swift
//  OneFiMovies
//
//  Created by Perfect Aduh on 29/05/2019.
//  Copyright © 2019 Perfect Aduh. All rights reserved.
//

import UIKit

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
        
        titleLbl.text = movie.title
        directorLbl.text = movie.director
        yearLbl.text = movie.year
    }
}
