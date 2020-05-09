//
//  ContentView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct DocumentBrowser: UIViewControllerRepresentable {

    typealias UIViewControllerType = TestVC

    func makeUIViewController(context: Context) -> TestVC {
        return TestVC()
    }

    func updateUIViewController(_ uiViewController: TestVC, context: Context) {

    }
}

struct ContentView: View {
    
    @State private var sheetShown = false
    
    var body: some View {
        NavigationView {
            Button(action: {
                self.sheetShown = true
            }) {
                Text("boi open the files")
            }
        }.sheet(isPresented: $sheetShown) {
            DocumentBrowser()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
