//
//  DocumentsManager.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

enum DirectoryChildrenDirs: String, CaseIterable {
    case musicDirectory = "Music"
//
//    func getDirectory() -> URL {
//        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        switch self {
//        case .musicDirectory:
//            if (!directoryExists()) {
//
//            }
////            return directoryExists()
//        }
//    }
    
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
    
    private init() {
        createDirectories()
    }
 
    fileprivate func directoryExistsAtPath(_ path: String) -> Bool {
        var isDirectory = ObjCBool(true)
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    func createDirectories() {
        // Will create the listed directories in the DirectoryChildrenDirs enum
        for children in DirectoryChildrenDirs.allCases {
            let fileManager = FileManager.default
            let childrenPath = documentsUrl.appendingPathComponent("\(children.rawValue)")
            let exists = directoryExistsAtPath(childrenPath.path)
            if (exists) {
                print("✅ \(children.rawValue) directory is already created.")
            } else {
                do {
                    try fileManager.createDirectory(at: childrenPath, withIntermediateDirectories: true)
                    print("✅ \(children.rawValue) directory was created.")
                } catch {
                    print("🛑 Failed creating \(children.rawValue) directory due to error: \(error)")
                }
            }

        }
    }
}

extension DocumentsManager {
    
    func copyFileToMusicDir(url: URL) {
//        if FileManager.default.fileExists(atPath: musicDirUrl.appendingPathComponent(url.lastPathComponent).absoluteString) {
//            print("Bai exista deja ")
//        } else if FileManager.default.fileExists(atPath: url.path) {
//            // We will copy the file into our Music dir.
//            do {
//                let futureImportPath = musicDirUrl.appendingPathComponent(url.lastPathComponent)
//                try FileManager.default.copyItem(at: url, to: futureImportPath)
//                print("Copied.")
//            } catch {
//                print("Crashed like a bitch \(error)")
//                // silent crash :)
//            }
//        }
        
    }
    
    func copyFilesToMusicDir(from urls: [URL]) -> [URL] {
        createDirectories()
        for url in urls {
            print("Copying ")
            copyFileToMusicDir(url: url)
        }
        return []
    }
}
