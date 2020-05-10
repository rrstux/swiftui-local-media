//
//  HomeScreenView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    PlaylistsWidgetView()
                    
                }
                Spacer()
                if (store.player.playerState == .playing || store.player.playerState == .paused) {
                    BottomPlayerWidgetView()
                }
            }
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarTitle("Home")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().environmentObject(Store()).environment(\.colorScheme, .dark)
    }
}
