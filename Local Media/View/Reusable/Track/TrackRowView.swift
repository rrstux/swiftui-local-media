//
//  TrackRowView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackRowView: View {
    
    @State var track: Track
    @EnvironmentObject var store: Store
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle().fill(Color(.tertiarySystemGroupedBackground)).shadow(radius: 1)
                if track.artworkImage != nil {
                    Image(uiImage: track.artworkImage!).resizable().aspectRatio(contentMode: .fit)
                } else {
                    Image(systemName: "music.note").foregroundColor(Color(Colors.primary.get()))
                }
            }.frame(width: 50, height: 50)
            HStack {
                Text(track.listName).fontWeight(.medium).lineLimit(2)
            }
            Spacer()
        }.onTapGesture {
            self.store.player.play(playable: self.track)
        }
    }
}

struct TrackRowView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let previewTrack = Track(context: context)
        let image = UIImage(named: "MockManuChao")!
        previewTrack.artwork = image.pngData()
        previewTrack.title = "Bongo Bong"
        previewTrack.artist = "Manu Chao"
        return TrackRowView(track: previewTrack).environmentObject(Store())
    }
}
