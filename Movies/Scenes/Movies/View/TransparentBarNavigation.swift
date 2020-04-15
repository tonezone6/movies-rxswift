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
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .systemTeal
        navigationBar.backgroundColor = .darkGray
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.backIndicatorImage = .back
        navigationBar.backIndicatorTransitionMaskImage = .back
        
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
    static let back = UIImage(named: "arrow_left")
}
