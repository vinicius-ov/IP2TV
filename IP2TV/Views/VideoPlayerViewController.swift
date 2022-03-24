//
//  VideoPlayerViewController.swift
//  IP2TV
//
//  Created by Vinicius on 21/03/22.
//

import UIKit
import SwiftUI
import TVVLCKit

class VideoPlayerViewController: UIViewController {

    var mediaPlayer = VLCMediaPlayer()
    var media: VLCMedia!
    var videoFilePath: String = ""
    var location: CGPoint?

    @IBOutlet weak var movieView: UIView!

    init(videoPath: String) {
        super.init(nibName: "VideoPlayerViewController", bundle: Bundle.main)
        self.videoFilePath = videoPath
        setupMedia()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopActivity()
    }

    private func setupMedia() {

        guard let videoFileURL = URL(string: videoFilePath) else { return }

        //mediaListPlayer.mediaPlayer.drawable = movieView
        mediaPlayer.drawable = self.view

        media = VLCMedia(url: videoFileURL)

        mediaPlayer.media = media
        mediaPlayer.play()
        // toggleHud(self)
    }

    private func stopActivity() {
        mediaPlayer.stop()
    }

    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let press = presses.first else { return }
        switch press.type {
        case .playPause:
            if mediaPlayer.isPlaying {
                mediaPlayer.pause()
            } else {
                mediaPlayer.play()
            }
        default: break
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location: CGPoint = touches.first?.location(in: self.view) else { return }
        self.location = location
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location: CGPoint = touches.first?.location(in: self.view) else { return }
        if location.y + 50 > (self.location?.y ?? 0) + 20 {
            //show overlay
            print("must show overlay")
        }
    }

}
