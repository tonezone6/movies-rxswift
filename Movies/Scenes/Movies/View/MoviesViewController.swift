//
//  ViewController.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MoviesViewController: UIViewController {
    private let model: MoviesViewModel
    
    private(set) var filterButton = UIBarButtonItem()
    private(set) var loadingVC: LoadingViewController!
    private(set) var listVC: MovieListViewController!
    private(set) var placeholderVC: PlaceholderViewController!
    
    private var filtersButtonHandler: () -> Void = {}
    private var selectedItemHandler: (IndexPath) -> Void = { _ in }
    private let disposeBag = DisposeBag()

    init(viewModel: MoviesViewModel,
         filtersButtonHandler: @escaping () -> Void,
         selectedItemHandler: @escaping (IndexPath) -> Void) {
        
        self.model = viewModel
        self.filtersButtonHandler = filtersButtonHandler
        self.selectedItemHandler = selectedItemHandler
        super.init(nibName: nil, bundle: nil)
        
        commonSetup()
        setupBindings()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBindings() {
        model.loading
            .drive(rx.handleLoading)
            .disposed(by: disposeBag)
        
        model.refresh
            .drive(listVC.refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        model.failure
            .drive(rx.handleError)
            .disposed(by: disposeBag)
        
        model.queryActive
            .drive(rx.handleFilterButton)
            .disposed(by: disposeBag)
        
        model.movies
            .drive(listVC.tableView.rx.items(cellIdentifier: MovieCell.reuseID, cellType: MovieCell.self))
                { _, movie, cell in cell.configure(with: movie) }
            .disposed(by: disposeBag)
        
        filterButton.rx.tap
            .bind { [unowned self] in self.filtersButtonHandler() }
            .disposed(by: disposeBag)
        
        listVC.tableView.rx.itemSelected
            .bind { [unowned self] indexPath in self.selectedItemHandler(indexPath) }
            .disposed(by: disposeBag)
    }
    
    func commonSetup() {
        navigationItem.rightBarButtonItems = [filterButton]
        
        loadingVC = LoadingViewController()
        listVC = MovieListViewController(refreshHandler: { [unowned self] in
            self.model.fetch(refresh: true)
        })
        placeholderVC = PlaceholderViewController(retryHandler: { [unowned self] in
            self.model.fetch()
        })
    }
}

