//
//  Webservice.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation
import RxSwift

struct Webservice {
    func fetchMovies() -> Observable<[Movie]> {
        Observable.create { subscriber in
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 1.5)
                                
                // let error = URLError.init(.badServerResponse)
                // subscriber.onError(error)
                
                subscriber.onNext(Movie.data)
                // subscriber.onNext([])
            }
            return Disposables.create()
        }
    }
}
