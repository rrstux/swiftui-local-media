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
                
                Section(header: Text("Options")) {
                    Toggle("Use as blurred background on the Play screen", isOn: Binding.constant(true))
                    Toggle("Always play on repeat", isOn: Binding.constant(true))
                    Toggle("Count # of plays", isOn: Binding.constant(true))
                    Stepper("Volume on play: 100", value: Binding.constant(30), in: 0...100)
                }
                
                Section(header: Text("File Details "), footer: Text("")) {
                    HStack {
                        HStack {
                            Text("File Name")
                            Spacer()
                        }.frame(width: 100)
                        TextField("File Name", text: Binding($track.fileName)!)
                    }
                    HStack {
                        HStack {
                            Text("File URL")
                            Spacer()
                        }.frame(width: 100)
                        TextField("File URL", text: Binding($track.fileUrl)!)
                    }
                }
                
                Section {
                    Text("pizda mati salveaza").onTapGesture {
                        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                        
                        
                        
                        do {
                            
                            try context.save()
                        } catch {
                            print("Errrr \(error)")
                        }
                    }
                    
                }
                
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
