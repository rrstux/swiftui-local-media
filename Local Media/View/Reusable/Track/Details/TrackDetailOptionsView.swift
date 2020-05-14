//
//  TrackDetailOptionsView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailOptionsView: View {
    
    private var viewModel = ViewModel()
    
    var body: some View {
        Section(header: Text("Track Options"),
                footer: Text("Track options affect the current track only and will ignore any other setting from the playlist.")) {
            ForEach(viewModel.traits, id: \.self) { (trait: Trait) in
                HStack {
                    if trait.valueType != nil {
                        if trait.valueType! == TraitsValueTypes.boolean.rawValue {
                            Toggle(trait.value!, isOn: Binding.constant(true))
                        }
                        if trait.valueType! == TraitsValueTypes.string.rawValue {
                            TextField(trait.value!, text: Binding.constant("da"))
                        }
                        if trait.valueType! == TraitsValueTypes.stepper.rawValue {
                            Stepper(trait.value!, value: Binding.constant(30), in: 0...100)
                        }
                        if trait.valueType! == TraitsValueTypes.double.rawValue {
                            HStack {
                                Text(trait.value!)
                                Spacer()
                                TextField(trait.value!,
                                          value: Binding.constant(0),
                                          formatter: NumberFormatter())
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    } else {
                        Text("\(trait.value!) option is disabled currently.")
                    }
                }
            }
            //            Toggle("Use as blurred background on the Play screen", isOn: Binding.constant(true))
            //            Toggle("Always play on repeat", isOn: Binding.constant(true))
            //            Toggle("Count # of plays", isOn: Binding.constant(true))
            //            Stepper("Volume on play: 100", value: Binding.constant(30), in: 0...100)
        }
    }
}

extension TrackDetailOptionsView {
    
    class ViewModel {
        @Published var traits: [Trait] = []
        
        init() {
            do {
                self.traits = try CoreDataManager.shared.get()
            } catch {
                print("🛑 Could not fetch traits in TrackDetailOptionsView.ViewModel")
            }
        }
    }
}

struct TrackDetailOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailOptionsView()
    }
}
