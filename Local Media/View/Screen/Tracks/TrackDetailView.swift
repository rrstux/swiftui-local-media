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
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Song Details")) {

                    HStack {
                        Text("dada \(track.title ?? "default")")
                        Spacer()
                        TextField("Tes", text: Binding($track.title)!)
                    }
                }
                
                Section {
                    Text("pizda mati").onTapGesture {
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
