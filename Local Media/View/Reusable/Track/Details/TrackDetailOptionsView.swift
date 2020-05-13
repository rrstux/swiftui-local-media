//
//  TrackDetailOptionsView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailOptionsView: View {
    var body: some View {
        Section(header: Text("Options")) {
            Toggle("Use as blurred background on the Play screen", isOn: Binding.constant(true))
            Toggle("Always play on repeat", isOn: Binding.constant(true))
            Toggle("Count # of plays", isOn: Binding.constant(true))
            Stepper("Volume on play: 100", value: Binding.constant(30), in: 0...100)
        }
    }
}

struct TrackDetailOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailOptionsView()
    }
}
