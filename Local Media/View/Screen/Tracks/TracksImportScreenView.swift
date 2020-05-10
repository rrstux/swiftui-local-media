//
//  TracksImportScreenView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI
import MobileCoreServices
import AVFoundation

class DocumentBrowserViewController: UIDocumentPickerViewController, UIDocumentPickerDelegate {

    var store: Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.allowsMultipleSelection = true
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        store?.loadTracks(from: urls)
        
    }
}

struct TracksImportScreenViewRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = DocumentBrowserViewController
    
    @EnvironmentObject var store: Store
    
    func makeUIViewController(context: Context) -> DocumentBrowserViewController {
        let vc = DocumentBrowserViewController(documentTypes: [kUTTypeAudio as String,
                                                               kUTTypeFolder as String,
                                                               kUTTypeDirectory as String], in: .import)
//        vc.store = store
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DocumentBrowserViewController, context: Context) {
        uiViewController.store = store
    }
}

struct TracksImportScreenView: View {
    var body: some View {
        TracksImportScreenViewRepresentable()
    }
}

struct TracksImportScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TracksImportScreenView().environment(\.colorScheme, .dark)
    }
}
