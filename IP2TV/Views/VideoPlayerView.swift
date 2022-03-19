//
//  VideoPlayerView.swift
//  IP2TV
//
//  Created by Vinicius on 19/03/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var url: String
    @State var player = AVPlayer()
    @State private var showingAlert = false
    @State private var playerStatus: AVPlayer.Status = .unknown
    
    var body: some View {
//        let playerUrl = URL(string: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8")
        
        let playerUrl = URL(string: "http://efv.me:80/ViniciusValvassori/j7SCr5/13253")

        
        if playerUrl != nil {
        VideoPlayer(player: player)
            //adapt for 4k??, insert resolution based on device
                .frame(width: 1920, height: 1080, alignment: .center)
                .onAppear() {
                player = AVPlayer(url: playerUrl!)
                player.play()
            }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(url: "http::\\\\")
    }
}
