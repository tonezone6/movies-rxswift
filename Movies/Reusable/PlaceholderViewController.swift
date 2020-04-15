//
//  PlaceholderViewController.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import SwiftHelpers

final class PlaceholderViewController: UIViewController {
    private var retryHandler: () -> () = {}
    
    init(retryHandler: @escaping () -> ()) {
        self.retryHandler = retryHandler
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .background
        view.addSubview(stackView, constraints: [
            .centerX, .centerY, .width(multiplier: 0.6)
        ])

        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(placeholder: String) {
        label.text = placeholder
    }
    
    @objc private func buttonAction() {
        retryHandler()
    }
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 6.0
        button.backgroundColor = .white
        button.setTitle("Retry", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
}
