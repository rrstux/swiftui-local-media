//
//  TrackDetailSectionFileDetailsView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailSectionFileDetailsView: View {
    
    @EnvironmentObject var track: Track
    
    var body: some View {
        Section(header: Text("File Details "), footer: Text("")) {
            HStack {
                HStack {
                    Text("File Name")
                    Spacer()
                }.frame(width: 100)
                TextField("File Name", text: Binding($track.fileName)!)
            }
            HStack {
                HStack {
                    Text("File URL")
                    Spacer()
                }.frame(width: 100)
                TextField("File URL", text: Binding($track.fileUrl)!)
            }
        }
        
    }
}

struct TrackDetailSectionFileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailSectionFileDetailsView()
    }
}
