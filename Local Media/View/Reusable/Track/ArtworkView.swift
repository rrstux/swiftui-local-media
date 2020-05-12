//
//  ArtworkView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct ArtworkView: View {
    
    @State var image: UIImage?
    
    var body: some View {
        HStack {
            Spacer()
            if image !== nil {
                Image(uiImage: image!).resizable()
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
        }.frame(height: 250)
    }
}


struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkView()
    }
}
