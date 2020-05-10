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

    func getUrl() -> URL {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        switch self {
        case .musicDirectory: return documentsUrl.appendingPathComponent("\(self.rawValue)")
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
    
    func fileExists(atPath path: String) -> Bool {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: path)
    }
    
    func copyFile(url: URL, toDirectory: DirectoryChildrenDirs) -> Bool {
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: url.path) {
            do {
                let futureImportPath = toDirectory.getUrl().appendingPathComponent(url.lastPathComponent)
                try fileManager.copyItem(at: url, to: futureImportPath)
                print("✅ \(url.lastPathComponent) was copied into \(toDirectory.rawValue).")
                return true
            } catch {
                print("🛑 Could not copy \(url.lastPathComponent) into \(toDirectory.rawValue) due to error: \(error)")
                return false
            }
        } else {
            return false
        }
        
    }
    
    func copyFiles(from urls: [URL], toDirectory directory: DirectoryChildrenDirs) -> [URL] {
        createDirectories()
        var copiedFiles: [URL] = []
        for url in urls {
            if fileExists(atPath: directory.getUrl().appendingPathComponent(url.lastPathComponent).path) {
                print("🛑 Could not copy \(url.lastPathComponent) into \(directory.rawValue) because it exists already.")
            } else {
                if copyFile(url: url, toDirectory: directory) {
                    copiedFiles.append(url)
                }
            }
        }
        return copiedFiles
    }
}
