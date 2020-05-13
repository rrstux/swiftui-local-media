//
//  Trait.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

enum Traits: String, CaseIterable {
    case useBlurredBackgroundOnPlay = "T_USE_BLURRED_BACKGROUND_ON_PLAY"
    case useAlwaysPlayOnRepeat = "T_USE_ALWAYS_PLAY_ON_REPEAT"
    case useCountPlays = "T_USE_COUNT_PLAYS"
    case useVolumeOnPlay = "T_USE_VOLUME_ON_PLAY"
    
    var value: String {
        switch self {
        case .useBlurredBackgroundOnPlay: return "Use blurred background on play screen."
        case .useAlwaysPlayOnRepeat: return "Should play on repeat, always."
        case .useCountPlays: return "Should count the number of plays."
        case .useVolumeOnPlay: return "Song default volume on play."
        }
    }
}

extension Trait {

}
