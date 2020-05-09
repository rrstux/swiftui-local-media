//
//  HomeScreenView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    PlaylistsWidgetView()
                    
                }
                Spacer()
                ZStack {
                    ZStack {
                        Rectangle().fill(Color(.systemGray6)).padding(.top, 20)
                        Rectangle().fill(Color(.systemGray6)).frame(height: 70).cornerRadius(10)
                    }
                    HStack {
                        VStack {
                            Text("N-Joi - Anthem mix 25 hours bici stop being a bici")
                                .fontWeight(.bold)
                                .foregroundColor(Color(Colors.primary.get()))
                        }.padding()
                        Spacer()
                        HStack {
                            Image(systemName: "backward.end")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding(.horizontal)
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color(Colors.primary.get()))
                                .padding(.horizontal)
                            Image(systemName: "forward.end")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding(.horizontal)
                        }.padding()
                    }
                }.frame(height: 70)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("Local Player")
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().environment(\.colorScheme, .dark)
    }
}
