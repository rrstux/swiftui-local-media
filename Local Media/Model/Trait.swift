//
//  Trait.swift
//  Local Media
//
//  Created by Robert Sandru on 5/13/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation

enum TraitsValueTypes: String, CaseIterable {
    case boolean = "VT_BOOLEAN"
    case string = "VT_STRING"
    case double = "VT_DOUBLE"
    case stepper = "VT_STEPPER"
    case slider = "VT_SLIDER"
}

enum Traits: String, CaseIterable {
    case useBlurredBackgroundOnPlay = "T_USE_BLURRED_BACKGROUND_ON_PLAY"
    case useAlwaysPlayOnRepeat = "T_USE_ALWAYS_PLAY_ON_REPEAT"
    case useCountPlays = "T_USE_COUNT_PLAYS"
    case useCurrentPlays = "T_USE_CURRENT_PLAYS"
    case useVolumeOnPlay = "T_USE_VOLUME_ON_PLAY"
    case useBackgroundPlay = "T_USE_BACKGROUND_PLAY"
    case useHiddenMediaPlayerInfo = "T_USE_HIDDEN_MEDIA_PLAYER_INFO"
    case useTrackStartingPoint = "T_USE_TRACK_STARTING_POINT"
    
    var value: String {
        switch self {
        case .useBlurredBackgroundOnPlay: return "Use blurred background on play screen"
        case .useAlwaysPlayOnRepeat: return "Should play on repeat, always"
        case .useCountPlays: return "Count plays"
        case .useCurrentPlays: return "Plays"
        case .useVolumeOnPlay: return "Song default volume on play"
        case .useBackgroundPlay: return "Background play"
        case .useHiddenMediaPlayerInfo: return "Hide track info in the iPhone Media Player"
        case .useTrackStartingPoint: return "Track starting point"
        }
    }
    
    var valueType: TraitsValueTypes {
        switch self {
        case .useBlurredBackgroundOnPlay: return .boolean
        case .useAlwaysPlayOnRepeat: return .boolean
        case .useCountPlays: return .boolean
        case .useCurrentPlays: return .double
        case .useVolumeOnPlay: return .stepper
        case .useBackgroundPlay: return .boolean
        case .useHiddenMediaPlayerInfo: return .boolean
        case .useTrackStartingPoint: return .slider
        }
    }
}

extension Trait {

}
