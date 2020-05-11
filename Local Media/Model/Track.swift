//
//  Track.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit
import CoreData



extension Track {
    
    var listName: String {
        guard let artist = artist, let title = title, artist.count > 0, title.count > 0 else {
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
        let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDir.appendingPathComponent(fileUrl ?? "")
    }
    
    var playableTitle: String {
        get {
            return listName
        }
    }
    
    var playableArtist: String? {
        get {
            return artist
        }
    }
    
    var playableArtwork: UIImage? {
        get {
            return artworkImage
        }
    }
}
