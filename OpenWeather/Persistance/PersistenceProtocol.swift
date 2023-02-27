//
//  PersistenceProtocol.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation
import RealmSwift

// Add storable protocol to object class
public protocol Storable { }
extension Object: Storable { }

struct Sorted {
    var key: String
    var ascending: Bool = true
}

protocol StorageContext {
    // Save an object that is conformed to the `Storable` protocol
    func save(object: Storable) throws

    // Update an object that is conformed to the `Storable` protocol
    func update(block: @escaping () -> Void) throws

    // Delete an object that is conformed to the `Storable` protocol
    func delete(object: Storable) throws

    // Return a list of objects that are conformed to the `Storable` protocol
    func fetch<T: Storable>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> [T]
}
