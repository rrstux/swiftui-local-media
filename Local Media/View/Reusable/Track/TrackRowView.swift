//
//  TrackRowView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackRowView: View {
    
    @EnvironmentObject var store: Store
    
    @Binding var track: Track
    @State var showEditSheet = false
    
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
                if (store.player.currentPlayable?.playableTitle == track.playableTitle) {
                    Text(track.listName).fontWeight(.medium).lineLimit(2).foregroundColor(Color(Colors.primary.get()))
                } else {
                    Text(track.listName).fontWeight(.medium).lineLimit(2)
                }
            }
            Spacer()
        }
        .background(Color(.systemBackground))
        .onTapGesture(count: 1) {
            self.store.player.play(playable: self.track)
        }.onLongPressGesture {
            self.showEditSheet = true
        }
        .sheet(isPresented: $showEditSheet) {
            TrackDetailView().environmentObject(self.track)
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
        return TrackRowView(track: Binding.constant(previewTrack)).environmentObject(Store())
    }
}
