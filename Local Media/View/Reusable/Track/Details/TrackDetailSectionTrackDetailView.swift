//
//  TrackDetailSectionTrackDetailView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailSectionTrackDetailView: View {
    
    @EnvironmentObject var track: Track
    
    var body: some View {
        Section(header: Text("Nice to have details ♥️"),
                footer: Text("Nice to have details will provide you some good user interface experience for the long run.")) {
                    
                    HStack {
                        HStack {
                            Text("Title")
                            Spacer()
                        }.frame(width: 60)
                        TextField("Title", text: Binding($track.title)!)
                    }
                    HStack {
                        HStack {
                            Text("Artist")
                            Spacer()
                        }.frame(width: 60)
                        TextField("Artist", text: Binding($track.artist)!)
                    }
                    HStack {
                        HStack {
                            Text("Album")
                            Spacer()
                        }.frame(width: 60)
                        TextField("Album", text: Binding($track.album)!)
                    }
                    HStack {
                        HStack {
                            Text("Year")
                            Spacer()
                        }.frame(width: 60)
                        TextField("Year",
                                  value: Binding($track.year),
                                  formatter: NumberFormatter(),
                                  onCommit: {
                                    UIApplication.shared.endEditing()
                        })
                    }
        }
    }
}

struct TrackDetailSectionTrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let previewTrack = Track(context: context)
        let image = UIImage(named: "MockManuChao")!
        previewTrack.artwork = image.pngData()
        previewTrack.title = "Bongo Bong"
        previewTrack.artist = "Manu Chao"
        return TrackDetailSectionTrackDetailView().environmentObject(previewTrack)
    }
}
