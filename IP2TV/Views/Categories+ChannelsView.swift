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

    @State private var mediaCategories: [MediaCategory] = []
    @State var mediaUrl: String
    @State var channelsForSelectedCategory: [MediaItem] = []
    @State var isLoaderVisible: Bool = true

    var body: some View {
        NavigationView {
//            VStack {
//                ProgressView().scaleEffect(3.0, anchor: .center)
//                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
//                    .padding(.bottom, 80)
//                Text("Carregando canais.").font(.system(size: 60))
//                Text("Por favor espere...").font(.system(size: 60))
//
//            }.hidden(isLoaderVisible)
            HStack {
                VStack {
                    Text("Categorias").padding()
                    List(mediaCategories) { item in
                        Button(item.groupTitle) {
                            channelsForSelectedCategory = item.channels
                        }
                    }

                }.border(Color.red)

                ProgressView().scaleEffect(3.0, anchor: .center)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                                    .padding(.bottom, 80).hidden(isLoaderVisible)

                VStack {
                    Text("Canais disponíveis").padding()
                    List(channelsForSelectedCategory) { item in
                        NavigationLink("\(item.tvgName ?? "") - \(item.mediaUrl ?? "")", destination: {
                            // adapt for 4k
                            VideoPlayerView(url: item.mediaUrl ?? "")
                                .frame(width: 1920, height: 1080, alignment: .center)
                        })

                    }
                }.border(Color.blue)
            }.frame(width: 1800, height: 1000, alignment: .center)
        }.task {
            do {
                guard let url = URL(string: mediaUrl) else {
                    return
                    // show error
                }
                let (data, _) = try await URLSession.shared.data(from: url)
                mediaCategories = ParseM3uFileToMediaItemList.parse(contentsData: data)
                channelsForSelectedCategory = mediaCategories.first?.channels ?? []
                isLoaderVisible = false
            } catch {
                mediaCategories = []
            }
        }
    }
}

struct CategoriesChannels_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesChannelsView(mediaUrl: "")
    }
}

extension View {
    @ViewBuilder func hidden(_ shouldShow: Bool) -> some View {
        switch shouldShow {
        case true: self
        case false:
            self.hidden()
        }
    }
}
