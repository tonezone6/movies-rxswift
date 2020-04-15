//
//  DragView.swift
//  StoreLayer
//
//  Created by Alex on 13/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

final class DragView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 3.0
        backgroundColor = UIColor(white: 220/255, alpha: 1.0)
    }
}
