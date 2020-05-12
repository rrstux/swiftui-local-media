//
//  MusicListWidgetView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct MusicListWidgetView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            List {
                ForEach(store.tracks, id: \.self) { (track: Track) in
                    TrackRowView(track: Binding.constant(track))
                }
                .onDelete { index in
                    print("Deleting")
                }
            }
        }
    }
}

struct MusicListWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListWidgetView().environmentObject(Store()).environment(\.colorScheme, .dark)
    }
}
