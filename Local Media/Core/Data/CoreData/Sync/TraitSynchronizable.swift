//
//  TraitSynchronizable.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

class TraitSynchronizable: Synchronizable {
    
    func sync() {
        print("🔄 Preparing Traits sync...")
        do {
            for trait in Traits.allCases {
                print("🟢 Syncing Trait \(trait.rawValue)...")
                let keyPredicate = NSPredicate(format: "key = %@", trait.rawValue)
                let valPredicate = NSPredicate(format: "value = %@", trait.value)
                let existingTraits: [Trait] = try CoreDataManager.shared.get(predicates: [keyPredicate, valPredicate])
                let traitExists = existingTraits.count > 0
                if !traitExists {
                    let newTrait = Trait(context: CoreDataManager.shared.context)
                    newTrait.key = trait.rawValue
                    newTrait.value = trait.value
                    newTrait.valueType = trait.valueType.rawValue
                    do {
                        try CoreDataManager.shared.save(model: newTrait)
                    } catch {
                        print("🛑 Could not sync \(trait.rawValue) trait. Err: \(error)")
                    }
                } else {
                    print("✅ Skipping \(trait.rawValue) sync because it exists in the database.")
                }
            }
        } catch {
            print("🛑 Could not sync Traits due to error: \(error)")
        }
    }
}
