//
//  CoreDataManager.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit
import CoreData
final class CoreDataManager {
    
    static var shared: CoreDataManager = CoreDataManager()
    
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    enum CoreDataManagerError: Error {
        case getFailed(err: Error)
        case saveFailed(err: Error)
    }
    
    private init() {}
}

// MARK: CoreData Wrapper
extension CoreDataManager {
    
    func get<T: NSManagedObject>(predicates: [NSPredicate] = []) throws -> [T] {
        do {
            let fetchRequest = T.fetchRequest()
            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
            fetchRequest.predicate = compoundPredicate
            let res: [T] = try context.fetch(fetchRequest) as! [T]
            return res
        } catch {
            throw CoreDataManagerError.getFailed(err: error)
        }
    }
    
    func save<T: NSManagedObject>(model: T) throws {
        do {
            try context.save()
        } catch {
            throw CoreDataManagerError.saveFailed(err: error)
        }
    }
}
