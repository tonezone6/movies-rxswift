//
//  LoadingViewController.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor(white: 240/255, alpha: 1.0)
        view.addSubview(stackView, constraints: [.centerX, .centerY, .width(multiplier: 0.6)])
        stackView.addArrangedSubview(spinner)
        stackView.addArrangedSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private(set) var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "  Loading..."
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
}
