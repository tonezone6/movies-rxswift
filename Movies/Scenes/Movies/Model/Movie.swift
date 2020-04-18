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
    let image: String
    let thumbnail: String
}
