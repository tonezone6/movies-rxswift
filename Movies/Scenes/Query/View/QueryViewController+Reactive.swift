//
//  QueryViewController+Rreactive.swift
//  StoreLayer
//
//  Created by Alex on 14/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: QueryViewController {
    var queryHandler: Binder<Query> {
        return Binder(self.base) { vc, query in
            vc.handleSelected(query)
        }
    }
}

extension QueryViewController {
    func handleSelected(_ query: Query) {
        // Selection.
        sortSegment.selectedSegmentIndex = query.sort.rawValue
        filterSegment.selectedSegmentIndex = query.filter.rawValue
        orderSegment.selectedSegmentIndex = query.ascending ? 0 : 1
        
        // Order control.
        let orderHidden = query.sort == .none
        orderSegment.isHidden = orderHidden
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
        // Reset button.
        let disabled = (query.sort == .none) && (query.filter == .none)
        if disabled {
            let unsel = UIColor.gray.withAlphaComponent(0.5)
            resetButton.setTitleColor(unsel, for: .normal)
            resetButton.alpha = 0.4
            resetButton.isUserInteractionEnabled = false
        } else {
            let sel = UIColor.systemTeal
            resetButton.setTitleColor(sel, for: .normal)
            resetButton.alpha = 1.0
            resetButton.isUserInteractionEnabled = true
        }
        
        // Update handler.
        queryHandler(query)
    }
}
