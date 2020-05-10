//
//  TrackProgressView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackProgressView: View {
    
    var progressBarHeight: CGFloat = 3
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { (proxy: GeometryProxy) in
                HStack(spacing: 0) {
                    Rectangle().fill(Color(Colors.primary.get())).frame(width: proxy.size.width/2)
                    Spacer()
                }
            }
        }.frame(height: progressBarHeight)
    }
}

struct TrackProgressView_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgressView()
    }
}
