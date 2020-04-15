//
//  Store.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import Foundation

protocol Store {
    associatedtype Object
    
    func save(_ object: Object)
    func update(_ object: Object)
    func delete(_ object: Object)
}
