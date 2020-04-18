//
//  MovieViewController.swift
//  StoreLayer
//
//  Created by Alex on 14/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import Kingfisher

final class MovieDetailsViewController: UIViewController {
    private var imageView = UIImageView()

    init(movie: Movie) {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.kf.setImage(
            with: URL(string: movie.image),
            options: [.transition(.fade(0.5)) ]
        )
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = imageView
    }
}
