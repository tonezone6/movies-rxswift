//
//  QueryViewController.swift
//  StoreLayer
//
//  Created by Alex on 13/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class QueryViewController: UIViewController {
    private let model: QueryViewModel
    private let disposeBag = DisposeBag()

    var resetHandler: () -> Void = { }
    var queryHandler: (Query) -> Void = { _ in }
    
    @IBOutlet weak var sortSegment: UISegmentedControl!
    @IBOutlet weak var orderSegment: UISegmentedControl!
    @IBOutlet weak var filterSegment: UISegmentedControl!
    @IBOutlet weak var resetButton: RoundedButton!
    
    init(viewModel: QueryViewModel,
         resetHandler: @escaping () -> Void,
         queryHandler: @escaping (Query) -> Void) {
    
        self.model = viewModel
        self.resetHandler = resetHandler
        self.queryHandler = queryHandler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSegmentTitles()
        setupBindings()
    }
    
    private func setupBindings() {
        model.query
            .drive(self.rx.queryHandler)
            .disposed(by: disposeBag)
        
        sortSegment.rx.selectedSegmentIndex
            .bind(to: model.sort)
            .disposed(by: disposeBag)
        
        orderSegment.rx.selectedSegmentIndex
            .bind(to: model.order)
            .disposed(by: disposeBag)
        
        filterSegment.rx.selectedSegmentIndex
            .bind(to: model.filter)
            .disposed(by: disposeBag)
       
        resetButton.rx.tap.bind { [unowned self] in
            self.model.resetButtonTapped()
            self.resetHandler()
        }.disposed(by: disposeBag)
    }
    
    private func setupSegmentTitles() {
        for (index, title) in model.sortTitles.enumerated() {
            sortSegment.setTitle(title, forSegmentAt: index)
        }
        
        for (index, title) in model.orderTitles.enumerated() {
            orderSegment.setTitle(title, forSegmentAt: index)
        }
        
        for (index, title) in model.filterTitles.enumerated() {
            filterSegment.setTitle(title, forSegmentAt: index)
        }
    }
}
