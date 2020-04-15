//
//  TransparentBarNavigation.swift
//  StoreLayer
//
//  Created by Alex on 15/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit

final class CustomNavigation: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barStyle = .default
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .systemTeal
        navigationBar.backgroundColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.backIndicatorImage = .back
        navigationBar.backIndicatorTransitionMaskImage = .back
        
        hidesBarsOnSwipe = true
        delegate = self
    }
}

extension CustomNavigation: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // Hide back button text
        let back = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = back
    }
}

extension UIImage {
    static let configuration = UIImage.SymbolConfiguration(weight: .semibold)
    
    static let queryOn = UIImage(systemName: "line.horizontal.3.decrease.circle.fill", withConfiguration: configuration)
    static let queryOff = UIImage(systemName: "line.horizontal.3.decrease.circle", withConfiguration: configuration)
    static let back = UIImage(systemName: "arrow.left", withConfiguration: configuration)
}
