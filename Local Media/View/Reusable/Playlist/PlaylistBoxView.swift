//
//  PlaylistBoxView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct PlaylistBoxView: View {
    
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
                        Text("plays: 151")
                    }
                    Spacer()
                    Image(systemName: "play.fill")
                        .resizable()
                        .foregroundColor(Color(Colors.primary.get()))
                        .frame(width: 50, height: 50)
                }
            }.padding()
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}

struct PlaylistBoxView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistBoxView().environment(\.colorScheme, .dark)
    }
}
