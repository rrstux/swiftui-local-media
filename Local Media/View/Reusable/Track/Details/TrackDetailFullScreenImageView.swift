//
//  TrackDetailFullScreenImageView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailFullScreenImageView: View {
    
    @State var image: UIImage
    
    var body: some View {
        Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
    }
}

struct TrackDetailFullScreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailFullScreenImageView(image: UIImage(systemName: "person")!)
    }
}
