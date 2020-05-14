//
//  TrackDetailOptionsView.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import SwiftUI

struct TrackDetailOptionsView: View {
    
    @EnvironmentObject var track: Track
    private var viewModel = ViewModel()
    
    var body: some View {
        Section(header: Text("Track Options"),
                footer: Text("Track options affect the current track only and will ignore any other setting from the playlist.")) {
            Text("dada")
        }
//                    ForEach(viewModel.traits, id: \.self) { (trait: Trait) in
//                        HStack {
//                            if trait.valueType != nil {
//                                if trait.valueType! == TraitsValueTypes.boolean.rawValue {
//                                    Toggle(trait.value!, isOn: Binding.constant(true))
//                                }
//                                if trait.valueType! == TraitsValueTypes.string.rawValue {
//                                    TextField(trait.value!, text: Binding.constant("da"))
//                                }
//                                if trait.valueType! == TraitsValueTypes.stepper.rawValue {
//                                    Stepper(trait.value!, value: Binding.constant(30), in: 0...100)
//                                }
//                                if trait.valueType! == TraitsValueTypes.double.rawValue {
//                                    HStack {
//                                        Text(trait.value!)
//                                        Spacer()
//                                        TextField(trait.value!,
//                                                  value: Binding.constant(0),
//                                                  formatter: NumberFormatter())
//                                            .multilineTextAlignment(.trailing)
//                                    }
//                                }
//                                if trait.valueType! == TraitsValueTypes.slider.rawValue {
//                                    VStack(alignment: .leading) {
//                                        Text(trait.value!)
//                                        HStack {
//                                            Text("2:56")
//                                            Slider(value: Binding.constant(30), in: 0...100)
//                                            Text("7:25")
//                                        }
//                                    }
//                                }
//                            } else {
//                                Text("\(trait.value!) option is disabled currently.")
//                            }
//                        }
//                    }
//        }
    }
}

extension TrackDetailOptionsView {
    
    class ViewModel {
        
        func getTraitValues(track: Track) -> [TraitValue] {
            return track.traitValue?.allObjects as! [TraitValue]
        }
    }
}

struct TrackDetailOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        let track = Track(context: CoreDataManager.shared.context)
        track.fileName = "Bai este ok"
        
        for previewTrait in Traits.allCases {
            let trait = Trait(context: CoreDataManager.shared.context)
            trait.key = previewTrait.rawValue
            trait.value = previewTrait.value
            
            let traitValue = TraitValue(context: CoreDataManager.shared.context)
            traitValue.value = "true"
            traitValue.trait = trait

            track.addToTraitValue(traitValue)
        }
    
        return TrackDetailOptionsView().environmentObject(track)
    }
}
