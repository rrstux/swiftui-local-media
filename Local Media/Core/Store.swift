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
        loadTracks()
        
        playerCancellable = player.objectWillChange.sink(receiveValue: {
            self.objectWillChange.send()
        })
    }
}

extension Store {
    
    func loadTracks() {
        print("🔄 Fetching tracks...")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var tracks: [Track] = []
        do {
            tracks = try context.fetch(Track.fetchRequest())
            print("✅ Fetched tracks. Count: \(tracks.count)")
        } catch {
            print("🛑 Could not fetch Tracks!")
        }
        
        self.tracks = tracks
    }
    
    func loadTracks(from urls: [URL]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let importedFiles = DocumentsManager.shared.copyFiles(from: urls, toDirectory: .musicDirectory)
        for importedFile in importedFiles {
            let track = Track(context: context)
            track.fileName = importedFile.lastPathComponent
            track.fileUrl = importedFile.absoluteString
            tracks.append(track)
        }
        do {
            try context.save()
            print("✅ Saved context with new tracks.")
        } catch {
            print("🛑 Could not save context with new tracks due to error: \(error)")
        }
    }
    
    func loadTracks(from path: String) {
        
    }
}
