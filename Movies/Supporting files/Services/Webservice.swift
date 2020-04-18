//
//  Webservice.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation
import RxSwift

protocol URLSessionProtocol { /* Define for testing. */ }
extension URLSession: URLSessionProtocol {}

struct Webservice {
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchMovies() -> Observable<[Movie]> {
        let url = URL(string: "https://tar-movies.glitch.me/movies")!
        
        return Observable.create { subscriber in
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    subscriber.onError(error)
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        subscriber.onNext(try decoder.decode([Movie].self, from: data))
                    } catch(let error) {
                        subscriber.onError(error)
                    }
                }
            }.resume()

            return Disposables.create()
        }
    }
}
