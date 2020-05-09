//
//  Colors.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

enum Colors: String {
    
    case primary = "Primary"
    
    static func get(for color: Colors) -> UIColor {
        return UIColor(named: color.rawValue)!
    }
}

extension Colors {
    
    func get() -> UIColor {
        return Colors.get(for: self)
    }
}




