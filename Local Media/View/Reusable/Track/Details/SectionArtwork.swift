//
//  SectionArtwork.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct SectionArtwork: View {
    
    @Binding var track: Track
    
    @State var showImagePicker: Bool = false
    @State var showDeleteArtworkAlert: Bool = false
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var body: some View {
        Section(header: Text("Artwork")) {
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("\(track.artworkImage == nil ? "Add" : "Change") artwork...")
            }
            Button(action: {
                self.showDeleteArtworkAlert = true
            }) {
                Text("Delete artwork...")
            }.alert(isPresented: $showDeleteArtworkAlert) {
                Alert(title: Text(""),
                      message: Text("Are you sure you want to delete the artwork?"),
                      primaryButton: .destructive(Text("Delete")) {
                        
                        self.track.title = "dsadas"
                        self.track.artworkImage = nil
                        do {
                            try self.context.save()
                            print("Saved context")
                        } catch {
                            print("🛑 \(error)")
                        }
                    }, secondaryButton: .cancel())
            }
            .disabled(track.artworkImage == nil)
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$track.artworkImage).onDisappear {
                do {
                    try self.context.save()
                } catch {
                    print("🛑 \(error)")
                }
            }
        }
    }
}

struct SectionArtwork_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let track = Track(context: context)
        return SectionArtwork(track: Binding.constant(track))
    }
}
