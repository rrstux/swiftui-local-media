//
//  DetailArtworkView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailArtworkView: View {
    
    @Binding var image: UIImage?
    @State var showFullScreenImage = false
    var body: some View {
        HStack {
            Spacer()
            if image !== nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.showFullScreenImage = true
                    }
            } else {
                VStack {
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 50, height: 80)
                        .foregroundColor(Color(Colors.primary.get()))
                    Text("Your awesome artwork")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top, 30)
                    Text("Find your songs easier and make your experience richer by adding a custom artwork to your song.")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                }
            }
            Spacer()
        }
        .frame(height: 250)
        .sheet(isPresented: $showFullScreenImage) {
            TrackDetailFullScreenImageView(image: self.image!)
        }
    }
}

struct TrackDetailArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailArtworkView(image: Binding.constant(nil))
    }
}
