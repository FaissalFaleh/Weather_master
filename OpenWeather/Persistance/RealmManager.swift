//
//  RealmManager.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation
import RealmSwift

public enum RealmManager {
    case basic
    case inMemory(identifier: String?)

    internal static var instance: Realm?
    internal var associated: String? {
        switch self {
        case .basic: return ""
        case .inMemory(let identifier): return identifier
        }
    }
    internal func getRealmInstance() -> Realm! {
        if RealmManager.instance == nil {
            var rmConfig = Realm.Configuration(
                schemaVersion: 1,
                migrationBlock: { _, _ in },
                deleteRealmIfMigrationNeeded: true
            )

            switch self {
            case .inMemory:
                if let identifier = self.associated {
                    rmConfig.inMemoryIdentifier = identifier
                }
            default:
                print("Basic configuration")
            }
            RealmManager.instance = try? Realm(configuration: rmConfig)
        }
        return RealmManager.instance!
    }

}

extension RealmManager: StorageContext {

    func save(object: Storable) throws {
        guard let realm = self.getRealmInstance() else {
            throw NSError()
        }

        try self.safeWrite {
            realm.add(object as! Object)
        }
    }

    func update(block: @escaping () -> Void) throws {
        try self.safeWrite {
            block()
        }
    }

    func delete(object: Storable) throws {
        guard let realm = self.getRealmInstance() else {
            throw NSError()
        }

        try self.safeWrite {
            realm.delete(object as! Object)
        }
    }

    func deleteAll<T>(_ model: T.Type) throws {
        guard let realm = self.getRealmInstance() else {
            throw NSError()
        }

        try self.safeWrite {
            let objects = realm.objects(model as! Object.Type)

            for object in objects {
                realm.delete(object)
            }
        }
    }

    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> [T] {
        var objects = self.getRealmInstance().objects(model as! Object.Type)

        if let predicate = predicate {
            objects = objects.filter(predicate)
        }

        if let sorted = sorted {
            objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }

        var accumulate: [T] = [T]()
        for object in objects {
            accumulate.append(object as! T)
        }

        return accumulate
    }

    func fetch<T>(_ model: T.Type, primaryKey: String) -> T? {
        let result = self.getRealmInstance().object(ofType: model as! Object.Type, forPrimaryKey: primaryKey) as? T
        return result
    }

    private func safeWrite(_ block: (() throws -> Void)) throws {
        guard let realm = self.getRealmInstance() else {
            throw NSError()
        }

        if realm.isInWriteTransaction {
            try block()
        } else {
            try realm.write(block)
        }
    }
}
