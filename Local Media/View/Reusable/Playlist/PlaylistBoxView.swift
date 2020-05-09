//
//  PlaylistBoxView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct PlaylistBoxView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var title = "Workout Playlist 💪🏻"
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.tertiarySystemGroupedBackground))
                .cornerRadius(10)
            VStack {
                HStack {
                    Text(title).font(.title)
                    Spacer()
                }
                Spacer()
                HStack {
                    HStack {
                        // stats
                        Text("tracks: \(viewModel.tracks.count)")
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundColor(Color(Colors.primary.get()))
                            .padding(10)
                            .frame(width: 50, height: 50)
                    }
                }
            }.padding()
        }
        .frame(width: 300, height: 300, alignment: .center)
        .onTapGesture {
            self.title = "tapped"
        }
        .onAppear {
            self.viewModel.loadTracks()
        }
    }
}

extension PlaylistBoxView {
    class ViewModel: ObservableObject {
        @Published private(set) var tracks: [Track] = []
        
        func loadTracks() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let da = Track(context: context)
            da.title = "The Day that Never Comes"
            da.artist = "Metallica"
            do {
                try context.save()
            } catch {
                print("Could not save...")
            }
            
            
        }
    }
}

struct PlaylistBoxView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistBoxView(viewModel: PlaylistBoxView.ViewModel()).environment(\.colorScheme, .dark)
    }
}
