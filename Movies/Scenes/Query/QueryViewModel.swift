//
//  QueryViewModel.swift
//  StoreLayer
//
//  Created by Alex on 13/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

struct QueryViewModel {
    private var lastQuery: Query
    
    let sort: BehaviorRelay<Int>
    let order: BehaviorRelay<Int>
    let filter: BehaviorRelay<Int>
    
    init(query: Query) {
        self.lastQuery = query
        
        sort = BehaviorRelay<Int>(value: query.sort.rawValue)
        order = BehaviorRelay<Int>(value: query.ascending ? 0 : 1)
        filter = BehaviorRelay<Int>(value: query.filter.rawValue)
    }
}

extension QueryViewModel {
    var sortTitles:   [String] { Query.sortTitles }
    var orderTitles:  [String] { Query.orderTitles }
    var filterTitles: [String] { Query.filterTitles }
    
    var query: Driver<Query> {
        Observable.combineLatest(sort, order, filter) { sort, order, filter in
            Query(selection: (sort, order, filter))
        }.asDriver(onErrorJustReturn: .none)
    }
    
    func resetButtonTapped() {
        sort.accept(0); order.accept(0); filter.accept(0)
    }
}
