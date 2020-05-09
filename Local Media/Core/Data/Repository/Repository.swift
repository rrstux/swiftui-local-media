//
//  Repository.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation
import Combine
import CoreData

protocol Repository {
    associatedtype T: NSManagedObject
    associatedtype E: Error
    
    func create() -> PassthroughSubject<T, E>
}
