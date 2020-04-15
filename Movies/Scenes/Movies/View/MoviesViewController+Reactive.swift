//
//  MoviesViewControllerr+Reactive.swift
//  StoreLayer
//
//  Created by Alex on 14/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: MoviesViewController {
    var handleLoading: Binder<Bool> {
        return Binder(self.base) { vc, loading in
            vc.handle(loading)
        }
    }
    
    var handleError: Binder<Error?> {
        return Binder(self.base) { vc, error in
            vc.handle(error)
        }
    }
    
    var handleFilterButton: Binder<Bool> {
        return Binder(self.base) { vc, activeQuery in
            vc.handleFilterButton(activeQuery)
        }
    }
}

extension MoviesViewController {
    func handle(_ loading: Bool) {
        if loading {
            listVC.remove()
            add(loadingVC)
            loadingVC.spinner.startAnimating()
            
            print("loading vc added.")
        } else {
            loadingVC.spinner.stopAnimating()
            loadingVC.remove()
            add(listVC)

            print("list vc added.")
        }
    }
    
    func handle(_ error: Error?) {
        guard let error = error else { return }
        listVC.remove()
        loadingVC.remove()
        
        placeholderVC.display(placeholder: error.localizedDescription)
        add(placeholderVC)
    }
    
    func handleFilterButton(_ activeQuery: Bool) {
        activeQuery ?
            (filterButton.image = .queryOn) :
            (filterButton.image = .queryOff)
    }
}
