//
//  MovieViewController.swift
//  StoreLayer
//
//  Created by Alex on 14/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    private var poster: UIImageView

    init(movie: Movie) {
        poster = UIImageView(image: UIImage(named: "img-\(movie.id)"))
        poster.backgroundColor = .white
        poster.contentMode = .scaleAspectFit
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = poster
    }
}
