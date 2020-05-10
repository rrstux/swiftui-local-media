//
//  FileManagerImport.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

enum AppDirectories: String {
    case musicDirectory = "Music"
    
    func getDirectory() -> URL {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        switch self {
        case .musicDirectory:
            if (!directoryExists()) {
                
            }
            return directoryExists()
        }
    }
    
    func directoryExists() -> Bool {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        switch self {
        case .musicDirectory: return FileManager.default.fileExists(atPath: documentsUrl.appendingPathComponent("/\(self.rawValue)/").absoluteString)
        }
    }
}

class DocumentsManager {
    
    static var shared: DocumentsManager = DocumentsManager()
    
    let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
}

extension DocumentsManager {
    
    func copyFileToMusicDir(url: URL) {
        if FileManager.default.fileExists(atPath: musicDirUrl.appendingPathComponent(url.lastPathComponent).absoluteString) {
            print("Bai exista deja ")
        } else if FileManager.default.fileExists(atPath: url.path) {
            // We will copy the file into our Music dir.
            do {
                let futureImportPath = musicDirUrl.appendingPathComponent(url.lastPathComponent)
                try FileManager.default.copyItem(at: url, to: futureImportPath)
                print("Copied.")
            } catch {
                print("Crashed like a bitch \(error)")
                // silent crash :)
            }
        }
        
    }
    
    func copyFilesToMusicDir(from urls: [URL]) -> [URL] {
        for url in urls {
            print("Copying ")
            copyFileToMusicDir(url: url)
        }
        return []
    }
}
