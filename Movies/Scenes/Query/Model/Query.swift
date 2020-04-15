//
//  Query.swift
//  StoreLayer
//
//  Created by Alex on 13/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

struct Query {
    enum Sort: Int   { case none, title, rating, year }
    enum Filter: Int { case none, recent }
    
    let sort: Sort
    let ascending: Bool
    let filter: Filter
}

extension Query {
    static var none = Query(sort: .none, ascending: true, filter: .none)
    
    static var sortTitles:   [String] { ["None", "Title", "Rating", "Year"] }
    static var orderTitles:  [String] { ["Ascending", "Descending"] }
    static var filterTitles: [String] { ["Show all", "Recent only"] }
}

extension Query: Equatable {
    var active: Bool {
        return sort != .none || filter != .none
    }
    
    typealias Selection = (sort: Int, ascending: Int, filter: Int)

    init(selection: Selection) {
        sort = Sort(rawValue: selection.sort)!
        ascending = selection.ascending == 0
        filter = Filter(rawValue: selection.filter)!
    }
}
