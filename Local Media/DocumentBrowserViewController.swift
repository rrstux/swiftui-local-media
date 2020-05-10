//
//  DocumentBrowserViewController.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import MobileCoreServices

class TestVC: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let vc = DocumentBrowserViewController(documentTypes: [kUTTypeAudio as String], in: .import)
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player!.rate == 0.0 {
                self.player!.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player!.rate == 1.0 {
                self.player!.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Robica Smecherul"

        if let image = UIImage(named: "lockscreen") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = player!.currentTime
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = 10
        nowPlayingInfo[MPMediaItemPropertyArtist] = "Robica Cantaretul"
        nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: CGSize(width: 50, height: 50), requestHandler: { size -> UIImage in
            return UIImage(systemName: "trash")!
        })
        
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player!.rate

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
}

extension TestVC: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    
//        let fileExists = FileManager.default.fileExists(atPath: urls[0].path)
        do {
            UIApplication.shared.beginReceivingRemoteControlEvents()
            try AVAudioSession.sharedInstance().setCategory(.playback)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            player = try AVAudioPlayer(contentsOf: urls[0])
            player?.prepareToPlay()
            player?.play()
            
            setupRemoteTransportControls()
            setupNowPlaying()
        } catch{
            
        }
//        controller.dismiss(animated: true)
    }
}
