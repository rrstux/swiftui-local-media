//
//  Store.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

class Store: ObservableObject {
    
    @Published var tracks: [Track] = []
    
    init() {
        loadTracks()
    }
}

extension Store {
    
    func loadTracks() {
        print("Loading")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let track1 = Track(context: context)
        track1.artist = "2Pac"
        track1.title = "Lil' Homies"
        
        let track2 = Track(context: context)
        track2.artist = "Johnny Cash"
        track2.title = "One"
        
        let track3 = Track(context: context)
        track3.artist = "Metallica"
        track3.title = "The Day that Never Comes (remix) an plm fai said isad as id sai das as"
        
        tracks.append(contentsOf: [track1, track2, track3])
    }
}
