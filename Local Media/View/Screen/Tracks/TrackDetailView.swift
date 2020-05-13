//
//  TrackDetailView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/11/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI
import CoreData

struct TrackDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var track: Track
    
    @State var genres: [String] = [
        "Rock",
        "Rap",
        "Hip Hop",
        "Classic",
        "Manele"
    ]
    @State var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                TrackDetailArtworkView(image: $track.artworkImage)
                TrackDetailSectionArtwork()
                TrackDetailSectionTrackDetailView()
                TrackDetailSectionFileDetailsView()
                TrackDetailOptionsView()
                
            }
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    do {
                        try context.save()
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {}
                }) {
                    Text("Save").foregroundColor(Color(Colors.primary.get()))
                }
            })
            .navigationBarTitle(track.playableTitle)
        }
    }
}

struct TrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let previewTrack = Track(context: context)
        previewTrack.album = "Until the End of Time"
        
        previewTrack.artist = "2Pac"
        previewTrack.title = "Lil' Homies"
        return TrackDetailView().environmentObject(previewTrack).environment(\.colorScheme, .dark)
    }
}
