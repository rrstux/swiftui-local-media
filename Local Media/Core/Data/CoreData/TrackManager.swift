//
//  TrackManager.swift
//  Local Media
//
//  Created by Robert Sandru on 5/14/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit

final class TrackManager {
    
    static var shared: TrackManager = TrackManager()
    
    private init() { }
}

// MARK: CoreData Loading Tracks
extension TrackManager {
    
    func getTracks() -> [Track] {
        var tracks: [Track] = []
        do {
            tracks = try CoreDataManager.shared.get()
        } catch {}
        return tracks
    }
}

// MARK: Importing Tracks
extension TrackManager {
    
    func importTracks(from urls: [URL]) -> [Track] {
        var tracks: [Track] = []
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let importedFiles = DocumentsManager.shared.copyFiles(from: urls, toDirectory: .musicDirectory)
        for importedFile in importedFiles {
            let track = Track(context: context)
            track.fileName = importedFile.lastPathComponent
            track.fileUrl = "\(DirectoryChildrenDirs.musicDirectory.rawValue)/\(importedFile.lastPathComponent)"
            tracks.append(track)
        }
        do {
            try context.save()
            print("✅ Saved context with new tracks.")
        } catch {
            print("🛑 Could not save context with new tracks due to error: \(error)")
        }
        
        return tracks
    }

}
