//
//  Playable.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

protocol Playable {
    
    /** Properties that are going to be shown in the player.  */
    var playableFileUrl: URL? {get}
    var playableTitle: String {get}
    
    var playableArtist: String? {get}
    var playableArtwork: UIImage? {get}
}
