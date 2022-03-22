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

    var mediaListPlayer = VLCMediaListPlayer()
    var media: VLCMedia!
    var videoFilePath: String = ""

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
        // let videoFileURL = URL(string: "http://efv.me:80/ViniciusValvassori/j7SCr5/13253")

        guard let videoFileURL = URL(string: videoFilePath) else { return }

        mediaListPlayer.mediaPlayer.delegate = self
        mediaListPlayer.mediaPlayer.drawable = self.view

        media = VLCMedia(url: videoFileURL)
        let mediaList = VLCMediaList()

        mediaList.add(media)
        mediaListPlayer.mediaList = mediaList
        mediaListPlayer.play(media)
        // toggleHud(self)
    }

    private func stopActivity() {
        mediaListPlayer.stop()
    }

}

extension VideoPlayerViewController: VLCMediaPlayerDelegate {

}
