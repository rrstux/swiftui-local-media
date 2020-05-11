//
//  Player.swift
//  Local Media
//
//  Created by Robert Sandru on 5/10/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
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
        do {
            UIApplication.shared.beginReceivingRemoteControlEvents()
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {}
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
            setupNowPlaying()
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

extension Player {
    
    func setupNowPlaying() {
        guard let playable = currentPlayable else { return }
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = playable.playableTitle
        
        if let artwork = playable.playableArtwork {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: artwork.size, requestHandler: { size in
                return artwork
            })
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player.currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = player.duration
        nowPlayingInfo[MPMediaItemPropertyArtist] = playable.playableArtist
        nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: CGSize(width: 50, height: 50), requestHandler: { size -> UIImage in
            return UIImage(systemName: "trash")!
        })
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}
