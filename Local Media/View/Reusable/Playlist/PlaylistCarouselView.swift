//
//  PlaylistCarouselView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct PlaylistCarouselView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                PlaylistBoxView()
                PlaylistBoxView()
                PlaylistBoxView()
                PlaylistBoxView()
                PlaylistBoxView()
            }
        }
    }
}

struct PlaylistCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCarouselView()
    }
}
