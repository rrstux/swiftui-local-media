//
//  ContentView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sheetShown = false
    
    var body: some View {
        TabView {
            HomeScreenView().tabItem {
                Image(systemName: "house").foregroundColor(Color.red)
                Text("Home")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
