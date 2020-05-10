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
                    HStack {
                        ZStack {
                            Rectangle().fill(Color(.tertiarySystemGroupedBackground)).frame(width: 50, height: 50)
                            Image(systemName: "music.note").foregroundColor(Color(Colors.primary.get()))
                        }
                        HStack {
                            Text(track.listName).fontWeight(.medium).lineLimit(2)
                        }
                        Spacer()
                        
                    }
                }.onDelete { index in
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
