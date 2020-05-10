//
//  TracksScreenView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TracksScreenView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Music")
                        .foregroundColor(Color(Colors.primary.get()))
                        .fontWeight(.medium)
                        .font(.largeTitle)
                    Spacer()
                }
                //                ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.tracks, id: \.self) { (track: Track) in
                        HStack {
                            Text(track.artist!)
                            Text("-")
                            Text(track.title!)
                        }
                    }
                }
                //                }
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarTitle("My Music")
            .padding()
                
            .onAppear(perform: {
                self.viewModel.loadTracks()
            })
            
        }
    }
}

extension TracksScreenView {
    
    class ViewModel: ObservableObject {
        @Published var tracks: [Track] = []
        
        func loadTracks() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let track1 = Track(context: context)
            track1.artist = "2Pac"
            track1.title = "Lil' Homies"
            
            let track2 = Track(context: context)
            track2.artist = "Johnny Cash"
            track2.title = "One"
            
            tracks.append(contentsOf: [track1, track2])
            
        }
    }
}

struct TracksScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TracksScreenView(viewModel: TracksScreenView.ViewModel()).environment(\.colorScheme, .dark)
    }
}
