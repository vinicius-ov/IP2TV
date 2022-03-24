//
//  VideoPlayerView.swift
//  IP2TV
//
//  Created by Vinicius Valvassori on 3/23/22.
//

import SwiftUI

struct VideoPlayerView: View {

    @State var mediaItem: MediaItem

    var body: some View {
        // adapt for 4k
        ZStack {
            VideoPlayerViewControllerRepresentable(url: mediaItem.mediaUrl ?? "")
                .frame(width: 1920, height: 1080, alignment: .center)
//            VideoControlsOverlayView(mediaItemId: mediaItem.id)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {


    static var previews: some View {
        let mediaItem: MediaItem = MediaItem()
        VideoPlayerView(mediaItem: mediaItem)
    }
}
