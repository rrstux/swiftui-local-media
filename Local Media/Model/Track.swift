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

extension Track: Playable {
    
    var playableFileUrl: URL? {
        guard let fileUrlString = fileUrl, let url = URL(string: fileUrlString) else { return nil }
        return url
    }
    
    var playableTitle: String {
        get {
            return listName
        }
    }
}
