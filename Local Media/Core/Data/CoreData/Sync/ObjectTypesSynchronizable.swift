//
//  ObjectTypesSynchronizable.swift
//  Local Media
//
//  Created by Robert Sandru on 5/14/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation
import CoreData

class ObjectTypesSynchronizable: Synchronizable {
    
    func sync() {
        print("🔄 Preparing ObjectTypes sync...")
        do {
            for objectType in ObjectTypes.allCases {
                print("🟢 Syncing ObjectType \(objectType.rawValue)...")
                let keyPredicate = NSPredicate(format: "key = %@", objectType.rawValue)
                let existingObjectTypes: [ObjectType] = try CoreDataManager.shared.get(predicates: [keyPredicate])
                let objectTypeExists = existingObjectTypes.count > 0
                if !objectTypeExists {
                    let newObjectType = ObjectType(context: CoreDataManager.shared.context)
                    newObjectType.key = objectType.rawValue
                    do {
                        try CoreDataManager.shared.save(model: newObjectType)
                    } catch {
                        print("🛑 Could not sync \(objectType.rawValue) ObjectType. Err: \(error)")
                    }
                } else {
                    print("✅ Skipping \(objectType.rawValue) sync because it exists in the database.")
                }
                
            }
        } catch {
            print("🛑 Could not sync ObjectTypes due to error: \(error)")
        }
    }
}
