//
//  Movie.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

struct Movie: Codable, Hashable {
    let id: Int
    let year: Int
    let title: String
    let rating: Double
}

extension Movie {
    static var data: [Movie] {
        [
            Movie(id: 107, year: 1994, title: "Pulp Fiction", rating: 8.9),
            Movie(id: 101, year: 2015, title: "The Hateful 8", rating: 7.8),
            Movie(id: 104, year: 2003, title: "Kill Bill: Vol. 1", rating: 8.1),
            Movie(id: 102, year: 2019, title: "Once upon a Time in Hollywood", rating: 7.7),
            Movie(id: 103, year: 2012, title: "Django", rating: 8.4),
            Movie(id: 105, year: 2004, title: "Kill Bill: Vol. 2", rating: 8.0),
            Movie(id: 106, year: 2009, title: "Inglourious Basterds", rating: 8.3),
            Movie(id: 108, year: 1993, title: "Reservoir Dogs ", rating: 8.3)
        ]
    }
}
