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
        print("Loading")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let track1 = Track(context: context)
        track1.artist = "2Pac"
        track1.title = "Lil' Homies"
        track1.artwork = UIImage(named: "MockPac")?.pngData()
        
        let track2 = Track(context: context)
        track2.artist = "Johnny Cash"
        track2.title = "One"
        track2.artwork = UIImage(named: "MockJohnnyCash")?.pngData()
        
        let track3 = Track(context: context)
        track3.artist = "Metallica"
        track3.title = "The Day that Never Comes (remix)"
        
        let track4 = Track(context: context)
        track4.artist = "Manu Chao"
        track4.title = "Bongo Bong"
        track4.artwork = UIImage(named: "MockManuChao")?.pngData()
        
        let track5 = Track(context: context)
        track5.artist = "James Brown"
        track5.title = "Sex Machine"
        
        tracks.append(contentsOf: [track1, track2, track3, track4, track5])
    }
    
    func loadTracks(from urls: [URL]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let importedFiles = DocumentsManager.shared.copyFilesToMusicDir(from: urls)
//        for url in urls {
//            if FileManager.default.fileExists(atPath: url.path) {
//                do {
//                    let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//                    let importedFilePath = documentsDir.appendingPathComponent(url.lastPathComponent)
//                    try FileManager.default.copyItem(at: url, to: importedFilePath)
//
//                    let track = Track(context: context)
//                    track.fileName = importedFilePath.lastPathComponent
//                    track.fileUrl = importedFilePath.absoluteString
//
//                    print(importedFilePath.absoluteString)
//                    tracks.append(track)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
    }
    
    func loadTracks(from path: String) {
        
    }
}
