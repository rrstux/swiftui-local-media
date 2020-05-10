//
//  ContentView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    @State private var sheetShown = false
    
    var body: some View {
        TabView {
            TracksScreenView().tabItem {
                Image(systemName: "music.note.list")
                Text("Tracks")
            }
            HomeScreenView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            Text("Profile").tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            Text("Settings").tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .accentColor(Color(Colors.primary.get()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Store()).environment(\.colorScheme, .dark)
    }
}
