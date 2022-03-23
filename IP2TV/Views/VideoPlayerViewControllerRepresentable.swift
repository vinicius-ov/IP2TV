//
//  VideoPlayerView.swift
//  IP2TV
//
//  Created by Vinicius on 19/03/22.
//

import SwiftUI

struct VideoPlayerViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = VideoPlayerViewController

    @State var url: String

    func makeUIViewController(context: Context) -> VideoPlayerViewController {
        VideoPlayerViewController(videoPath: url)
    }

    func updateUIViewController(_ viewController: VideoPlayerViewController,
                                context: Context) {
        // Nothing to do here, since our view controller is
        // read-only from the outside.
    }
}

struct VideoPlayerViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        // let videoFileURL = URL(string: "http://efv.me:80/ViniciusValvassori/j7SCr5/13253")

        VideoPlayerViewControllerRepresentable(url: "http://efv.me:80/ViniciusValvassori/j7SCr5/13253")
    }
}
