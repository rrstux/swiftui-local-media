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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                MusicListWidgetView()
                Spacer()
                BottomPlayerWidgetView()
            }
            .navigationBarTitle("My Music", displayMode: .automatic)
            .navigationBarItems(trailing:
                Button(action: {
                    print("Import")
                }) {
                    Image(systemName: "waveform.path.badge.plus")
                }.accentColor(Color(Colors.primary.get())))
            
        }
    }
}

struct TracksScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TracksScreenView().environment(\.colorScheme, .dark)
    }
}
