//
//  Store.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit
import Combine

class Store: ObservableObject {
    
    @Published var tracks: [Track] = []
    
    @Published var player: Player = Player()
    
    var playerCancellable: AnyCancellable?
    
    init() {
        self.tracks = TrackManager.shared.getTracks()
        
        playerCancellable = player.objectWillChange.sink(receiveValue: {
            self.objectWillChange.send()
        })
    }
}

extension Store {
    
    func loadTracks(from urls: [URL]) {
        self.tracks = TrackManager.shared.importTracks(from: urls)
    }
}
