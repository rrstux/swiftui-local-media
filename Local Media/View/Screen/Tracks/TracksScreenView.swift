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
            VStack(spacing: 0) {
                HStack {
                    Text("My Music")
                        .foregroundColor(Color(Colors.primary.get()))
                        .fontWeight(.medium)
                        .font(.largeTitle)
                    Spacer()
                }
                .padding()
                VStack {
                    List {
                        ForEach(viewModel.tracks, id: \.self) { (track: Track) in
                            HStack {
                                ZStack {
                                    Rectangle().fill(Color(.tertiarySystemGroupedBackground)).frame(width: 50, height: 50)
                                    Image(systemName: "music.note").foregroundColor(Color(Colors.primary.get()))
                                }
                                HStack {
                                    Text(track.listName).fontWeight(.medium).lineLimit(2)
                                }
                                Spacer()
                                
                            }
                        }.onDelete { index in
                            print("Deleting")
                        }
                    }
                }
                Spacer()
                ZStack {
                    ZStack {
                        Rectangle().fill(Color(.systemGray6)).padding(.top, 20)
                        Rectangle().fill(Color(.systemGray6)).frame(height: 70).cornerRadius(10)
                    }
                    HStack {
                        VStack {
                            Text("N-Joi - Anthem mix 25 hours bici stop being a bici")
                                .fontWeight(.bold)
                                .foregroundColor(Color(Colors.primary.get()))
                        }.padding()
                        Spacer()
                        HStack {
                            Image(systemName: "backward.end")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding(.horizontal)
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color(Colors.primary.get()))
                                .padding(.horizontal)
                            Image(systemName: "forward.end")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding(.horizontal)
                        }.padding()
                    }
                }.frame(height: 70)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("My Music")
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
            
            let track3 = Track(context: context)
            track3.artist = "Metallica"
            track3.title = "The Day that Never Comes (remix) an plm fai said isad as id sai das as"
            
            tracks.append(contentsOf: [track1, track2, track3])
        }
    }
}

struct TracksScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TracksScreenView(viewModel: TracksScreenView.ViewModel()).environment(\.colorScheme, .dark)
    }
}
