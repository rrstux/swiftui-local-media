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
    
    @Binding var track: Track
    @State var genres: [String] = [
        "Rock",
        "Rap",
        "Hip Hop",
        "Classic",
        "Manele"
    ]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Artwork")) {
                    VStack {
                        Text("upload photo")
                    }

                }
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
                                TextField("Artist", text: Binding($track.album)!)
                            }
                            HStack {
                                HStack {
                                    Text("Year")
                                    Spacer()
                                }.frame(width: 60)
                                TextField("Year", text: Binding.constant("2000"))
                            }
                            Picker(selection: $genres, label: Text("Genre")) {
                                ForEach(genres, id: \.self) { (genre: String) in
                                    Text(genre).tag(genre)
                                    
                                }
                                .navigationBarTitle("Select Gender")
                            }
                }
                
                Section(header: Text("Options")) {
                    Toggle("Use as blurred background on the Play screen", isOn: Binding.constant(true))
                    Toggle("Always play on repeat", isOn: Binding.constant(true))
                    Toggle("Count # of plays", isOn: Binding.constant(true))
                    
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
        return TrackDetailView(track: Binding.constant(previewTrack)).environment(\.colorScheme, .dark)
    }
}
