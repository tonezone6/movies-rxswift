//
//  MovieCell.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    static let reuseID = "MovieCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with movie: Movie) {
        thumbnailView.image = UIImage(named: "img-\(movie.id)")
        titleLabel.text = movie.title
        subtitleLabel.text = "\(movie.year)"
        ratingLabel.text = "\(movie.rating)"
    }
    
    private func configureSubviews() {
        addSubview(mainContainer, constraints: [.left(16), .right(16), .top(8), .bottom(0)])
        
        mainContainer.addSubview(mainStackView, constraints: [.left(), .right(16), .top(), .bottom()])
        mainStackView.addArrangedSubview(thumbnailView)
        mainStackView.addArrangedSubview(titleContainer)
        mainStackView.addArrangedSubview(ratingContainer)
        
        titleContainer.addSubview(titleStackView, constraints: [.left(), .right(), .centerY])
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        
        ratingContainer.addSubview(ratingLabel, constraints: [.left(), .right(), .centerY])
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6.0
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var ratingContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var thumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.widthAnchor.constraint(
            equalTo: imageView.heightAnchor, multiplier: 0.7).isActive = true
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = UIColor(white: 190/255, alpha: 1.0)
        return label
    }()
    
    private lazy var ratingLabel: RatingLabel = {
        let ratinglabel = RatingLabel()
        ratinglabel.widthAnchor.constraint(equalToConstant: 36).isActive = true
        ratinglabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        return ratinglabel
    }()
}
