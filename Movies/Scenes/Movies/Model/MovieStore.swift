//
//  MovieStore.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import RxSwift
import RxRelay

final class MovieStore {
    private var webservice: Webservice
    
    private let moviesSubject = PublishSubject<[Movie]>() // Start empty.
    private let querySubject = BehaviorRelay<Query?>(value: nil)
    private let filteredSubject = BehaviorRelay<[Movie]>(value: [])
    private let failureSubject = BehaviorRelay<Error?>(value: nil)
    private let disposeBag = DisposeBag()
    
    init(webservice: Webservice) {
        self.webservice = webservice
        
        movies.bind(to: filteredSubject)
            .disposed(by: disposeBag)
    }
    
    func fetch() {
        webservice
            .fetchMovies()
            .observeOn(MainScheduler.instance)
            .catchError { [unowned self] error in
                self.failureSubject.accept(error)
                return .just([])
            }
            .do(onNext: { [unowned self] _ in self.resetQuery() })
            .bind(to: moviesSubject)
            .disposed(by: disposeBag)
    }
    
    func perform(_ query: Query) {
        querySubject.accept(query)
    }
    
    func resetQuery() {
        querySubject.accept(nil)
    }
    
    func movie(at position: Int) -> Movie {
        filteredSubject.value[position]
    }
}

extension MovieStore {
    var query:       Query?              { querySubject.value }
    var queryActive: Observable<Bool>    { querySubject.map { $0?.active ?? false } }
    var failure:     Observable<Error?>  { failureSubject.asObservable() }
    
    var movies: Observable<[Movie]> {
        Observable.combineLatest(querySubject, moviesSubject) { [unowned self] query, movies in
            self.perform(query, with: movies)
        }
    }
}
