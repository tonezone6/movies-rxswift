//
//  AppCoordinator.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import SwiftHelpers

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    var movieStore: MovieStore
    
    init(navigation: UINavigationController) {
        childCoordinators = []
        navigationController = navigation
        
        movieStore = MovieStore(webservice: Webservice())
    }
    
    func start() {
        let model = MoviesViewModel(store: movieStore)
        
        let vc = MoviesViewController(
            viewModel: model,
            filtersButtonHandler: { [unowned self] in
                self.presentQuery()
            },
            selectedItemHandler: { [unowned self] indexPath in
                self.push(
                    self.movieStore.movie(at: indexPath.row))
            }
        )
        vc.title = "Movies"
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentQuery() {
        let query = movieStore.query ?? .none
        let model = QueryViewModel(query: query)
        
        let vc = QueryViewController(
            viewModel: model,
            resetHandler: { [unowned self] in
                self.movieStore.resetQuery()
            },
            queryHandler: { [unowned self] query in
                self.movieStore.perform(query)
            }
        )
        vc.modalPresentationStyle = .pageSheet
        vc.modalTransitionStyle = .coverVertical
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func push(_ movie: Movie) {
        let vc = MovieDetailsViewController(movie: movie)
        vc.title = movie.title
        navigationController.pushViewController(vc, animated: true)
    }
}
