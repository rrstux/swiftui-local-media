//
//  Player.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import AVFoundation
import Combine

enum PlayerState {
    case playing
    case paused
    case noTrack
}

class Player: ObservableObject {
    
    @Published var playerState: PlayerState = .noTrack
    
    @Published var currentPlayable: Playable?
    
    var player: AVAudioPlayer
    
    init() {
        player = AVAudioPlayer()
    }
    
    func play(playable: Playable) {
        guard let fileUrl = playable.playableFileUrl else { return }
        do {
            player = try AVAudioPlayer(contentsOf: fileUrl)
            player.stop()
            player.prepareToPlay()
            player.play()
            playerState = .playing
            currentPlayable = playable
        } catch {
            playerState = .noTrack
            currentPlayable = nil
        }
    }
    
    func pause() {
        player.pause()
        playerState = .paused
    }
    
    func unpause() {
        player.play()
        playerState = .playing
    }
    
    func stop() {
        player.stop()
        playerState = .noTrack
        currentPlayable = nil
    }
    
    func toggle() {
        if (playerState == .playing) {
            pause()
        } else if (playerState == .paused) {
            unpause()
        }
    }
}
