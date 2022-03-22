//
//  Categories+Channels.swift
//  IP2TV
//
//  Created by Vinicius on 18/03/22.
//
// will display 2 colums, left colunm category, right column channels of given category

import SwiftUI

// let parsed: [MediaItem]? =
//    try? ParseM3uFileToMediaItemList.parse(contentsData: Data(contentsOf: URL(string: "asdasd")!))!

struct CategoriesChannelsView: View {

    @State private var mediaItems: [MediaItem] = [MediaItem]()
    @State var mediaUrl: String

    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Text("Categorias")
                }.border(Color.red)
                VStack {
                    Text("Canais disponíveis").padding()
                    List(mediaItems) { item in
                        NavigationLink("\(item.tvgName ?? "") - \(item.mediaUrl ?? "")", destination: {
                            //adapt for 4k
                            VideoPlayerView(url: item.mediaUrl ?? "").frame(width: 1920, height: 1080, alignment: .center)
                        })
                    }
                }.border(Color.blue)
            }.frame(width: 1000, height: 800, alignment: .center)
        }.task {
            do {
                guard let url = URL(string: mediaUrl) else {
                    return
                    // show error
                }
                 let (data, _) = try await URLSession.shared.data(from: url)
                mediaItems = ParseM3uFileToMediaItemList.parse(contentsData: data) ?? []
            } catch {
                mediaItems = []
            }
        }
    }
}

struct CategoriesChannels_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesChannelsView(mediaUrl: "")
    }
}
