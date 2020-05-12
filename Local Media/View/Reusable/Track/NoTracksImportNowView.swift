//
//  NoTracksImportNowView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/12/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct NoTracksImportNowView: View {
    
    @EnvironmentObject var store: Store
    @State var showImportSheet: Bool = false
    
    var body: some View {
        VStack {
            Text(showImportSheet ? "🙈" : "🙊")
                .font(.system(size: 82))
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("It seems that you don't have any songs, yet.")
                .fontWeight(.medium)
                .padding(.top, 10)
            Button(action: {
                self.showImportSheet = true
            }) {
                Text("Import now")
                    .foregroundColor(Color(Colors.primary.get()))
                    .fontWeight(.bold)
                    .padding(.all, 20)
                    .overlay(RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(Colors.primary.get())))
            }
            .padding(.top, 50)
        }.sheet(isPresented: $showImportSheet) {
            TracksImportScreenView().environmentObject(self.store)
        }
    }
}

struct NoTracksImportNow_Previews: PreviewProvider {
    static var previews: some View {
        NoTracksImportNowView()
    }
}
