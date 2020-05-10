//
//  BottomPlayerWidgetView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct BottomPlayerWidgetView: View {
    
    @EnvironmentObject var store: Store
    
    var bottomLayerHeight: CGFloat = 70
    var progressBarHeight: CGFloat = 3
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle().fill(Color(.systemGray6)).padding(.top, 20)
                Rectangle().fill(Color(.systemGray6)).frame(height: bottomLayerHeight).cornerRadius(10)
                TrackProgressView(progressBarHeight: progressBarHeight).padding(.top, bottomLayerHeight-progressBarHeight)
            }
            HStack {
                VStack {
                    Text("\(store.player.currentPlayable?.playableTitle ?? "")")
                        .fontWeight(.bold)
                        .foregroundColor(Color(Colors.primary.get()))
                }.padding()
                Spacer()
                HStack {
                    Image(systemName: "backward.end")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal)
                    Button(action: {
                        self.store.player.toggle()
                    }) {
                        Image(systemName: self.store.player.playerState == .playing ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color(Colors.primary.get()))
                            .padding(.horizontal)
                    }
                    Image(systemName: "forward.end")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal)
                }.padding()
            }
        }.frame(height: 70)
    }
}

struct BottomPlayerWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPlayerWidgetView().environmentObject(Store()).environment(\.colorScheme, .dark)
    }
}
