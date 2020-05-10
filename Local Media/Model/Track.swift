//
//  Track.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

extension Track {
    
    var listName: String {
        return "\(artist ?? "") - \(title ?? "")"
    }
}
