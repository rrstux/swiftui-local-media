//
//  TraitsManager.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

class TraitsManager {
    
    static var shared: TraitsManager = TraitsManager()
    
    private init() {}
    
    /** Best called right after the app shows up. */
    func syncTraits() {
        do {
            for trait in Traits.allCases {
                print("🟢 Syncing trait \(trait.rawValue)...")
                let keyPredicate = NSPredicate(format: "key = %@", trait.rawValue)
                let valPredicate = NSPredicate(format: "value = %@", trait.value)
                let existingTraits: [Trait] = try CoreDataManager.shared.get(predicates: [keyPredicate, valPredicate])
                let traitExists = existingTraits.count > 0
                if !traitExists {
                    let newTrait = Trait(context: CoreDataManager.shared.context)
                    newTrait.key = trait.rawValue
                    newTrait.value = trait.value
                    do {
                        try CoreDataManager.shared.save(model: newTrait)
                    } catch {
                        print("🛑 Could not sync \(trait.rawValue) trait. Err: \(error)")
                    }
                }
            }
        } catch {
            print("🛑 Could not sync traits due to errr: \(error)")
        }
    }
}
