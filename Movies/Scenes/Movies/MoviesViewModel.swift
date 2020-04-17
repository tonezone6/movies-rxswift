//
//  MoviesViewModel.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import RxSwift
import RxRelay
import RxCocoa

final class MoviesViewModel {
    private var store: MovieStore
    
    private let loadingSubject = BehaviorRelay<Bool>(value: false)
    private let refreshSubject = BehaviorRelay<Bool>(value: false)
    private let disposeBag = DisposeBag()
        
    init(store: MovieStore) {
        self.store = store
        fetch()
    }
    
    func fetch(refresh: Bool = false) {
        refresh ?
            refreshSubject.accept(true) :
            loadingSubject.accept(true)
            
        store.fetch()
        store.movies
            .subscribe(onNext: { [unowned self] _ in
                refresh ?
                    self.refreshSubject.accept(false) :
                    self.loadingSubject.accept(false) })
            .disposed(by: disposeBag)
    }
}

extension MoviesViewModel {
    var loading:     Driver<Bool>    { loadingSubject.asDriver(onErrorJustReturn: false) }
    var refresh:     Driver<Bool>    { refreshSubject.asDriver() }
    var movies:      Driver<[Movie]> { store.movies.asDriver(onErrorJustReturn: []) }
    var queryActive: Driver<Bool>    { store.queryActive.asDriver(onErrorJustReturn: false) }
    var failure:     Driver<Error?>  { store.failure.asDriver(onErrorJustReturn: nil) }
}
