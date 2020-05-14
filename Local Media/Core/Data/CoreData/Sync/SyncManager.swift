//
//  SyncManager.swift
//  Local Media
//
//  Created by Robert Sandru on 5/14/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

class SyncManager {
    
    var synchronizables: [Synchronizable] = [
        TraitSynchronizable()
    ]
    
    func sync() {
        for synchronizable in synchronizables {
            synchronizable.sync()
        }
    }
}
