//
//  TracksScreenView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TracksScreenView: View {
    
    @EnvironmentObject var store: Store
    @State var showImportSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if (store.tracks.count > 0) {
                    MusicListWidgetView()
                    Spacer()
                } else {
                    NoTracksImportNowView()
                }
                if (store.player.playerState == .playing || store.player.playerState == .paused) {
                    BottomPlayerWidgetView()
                }
            }
            .navigationBarTitle("My Music", displayMode: .automatic)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showImportSheet = true
                    }) {
                        Image(systemName: "waveform.path.badge.plus")
                    }.accentColor(Color(Colors.primary.get()))
            })
        }.sheet(isPresented: $showImportSheet) {
            TracksImportScreenView().environmentObject(self.store)
        }
    }
}

struct TracksScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TracksScreenView().environmentObject(Store()).environment(\.colorScheme, .dark)
    }
}
