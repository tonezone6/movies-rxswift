//
//  MovieStore+Query.swift
//  StoreLayer
//
//  Created by Alex on 15/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation

extension MovieStore {
    func perform(_ query: Query?, with movies: [Movie], moreRecentThan year: Int = 2010) -> [Movie] {
        var sorted:   [Movie] = []
        var filtered: [Movie] = []
        
        guard let query = query else { return movies }
        
        switch query.sort {
        case .none:
            sorted = movies
            
        case .title:
            query.ascending ?
                (sorted = movies.sorted(by: { $0.title < $1.title })) :
                (sorted = movies.sorted(by: { $0.title > $1.title }))
            
        case .year:
            query.ascending ?
                (sorted = movies.sorted(by: { $0.year < $1.year })) :
                (sorted = movies.sorted(by: { $0.year > $1.year }))
            
        case .rating:
            query.ascending ?
                (sorted = movies.sorted(by: { $0.rating < $1.rating })) :
                (sorted = movies.sorted(by: { $0.rating > $1.rating }))
        }
        
        switch query.filter {
        case .none:
            filtered = sorted
            
        case .recent:
            filtered = sorted.filter { $0.year >= year }
        }
        
        return filtered
    }
}
