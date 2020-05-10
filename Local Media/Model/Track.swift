//
//  Track.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

extension Track {
    
    var listName: String {
        guard let artist = artist, let title = title else {
            return fileName ?? ""
        }
        return "\(artist) - \(title)"
    }
    
    var artworkImage: UIImage? {
        if let artworkData = artwork {
            return UIImage(data: artworkData)
        }
        return nil
    }
}
