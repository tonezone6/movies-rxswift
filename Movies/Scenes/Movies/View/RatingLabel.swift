//
//  RatingLabel.swift
//  StoreLayer
//
//  Created by Alex on 12/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

final class RatingLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        textColor = UIColor(white: 160/255, alpha: 1.0)
        font = .systemFont(ofSize: 12, weight: .semibold)
        
        layer.cornerRadius = 4.0
        layer.borderColor = UIColor(white: 210/255, alpha: 1.0).cgColor
        layer.borderWidth = 1.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
