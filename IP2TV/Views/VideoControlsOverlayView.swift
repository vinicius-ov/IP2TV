//
//  VideoControlsOverlayView.swift
//  IP2TV
//
//  Created by Vinicius Valvassori on 3/23/22.
//

import SwiftUI

class FavoriteChannelStatus: ObservableObject {
    @Published var isFavorited: Bool
    @Published var favoritedChannel: FavoriteChannel?

    init(isFavorited: Bool, favoritedChannel: FavoriteChannel?) {
        self.isFavorited = isFavorited
        self.favoritedChannel = favoritedChannel
    }
}

struct VideoControlsOverlayView: View {

    @State var isPlaying: Bool = true
    @State private var elapsedTime = 0
    @State private var isMute: Bool = false
    @State private var mediaItem: MediaItem?
    //@StateObject private var favoriteChannelStatus: FavoriteChannelStatus

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest var fetchedChannels: FetchedResults<FavoriteChannel>

    init(mediaItemId: String) {
        _fetchedChannels = FetchRequest(sortDescriptors: [],
                                       predicate: NSPredicate(format: "id == %@", mediaItemId))

//        _favoriteChannelStatus = StateObject(wrappedValue:
//                                                FavoriteChannelStatus(isFavorited: !_fetchedChannels.wrappedValue.isEmpty,
//                                                                      favoritedChannel: _fetchedChannels.wrappedValue.first))
    }

    var body: some View {

        HStack {
            Button(action: {
                isPlaying = !isPlaying
                //send notification to play/pause
            }, label: {
                if isPlaying {
                    Image(systemName: "pause.fill")
                } else {
                    Image(systemName: "play.fill")
                }

            })

            Button(action: {
                isMute = !isMute
                //send notification wih is mute state
            }, label: {
                if isMute {
                    Image(systemName: "speaker.fill")
                } else {
                    Image(systemName: "speaker.slash.fill")
                }
            })

            Button(action: {

//                if !favoriteChannelStatus.isFavorited {
//                    let favoriteChannel = FavoriteChannel(context: managedObjectContext)
//                    favoriteChannel.id = UUID()
//                    favoriteChannel.tvgName = mediaItem?.tvgName ?? ""
//                    favoriteChannel.mediaUrl = mediaItem?.mediaUrl ?? ""
//                    favoriteChannelStatus.favoritedChannel = favoriteChannel
//                    favoriteChannelStatus.isFavorited = true
//                } else {
//                    guard let channel = favoriteChannelStatus.favoritedChannel else { return }
//                    managedObjectContext.delete(channel)
//                    favoriteChannelStatus.isFavorited = false
//                }
//                PersistenceController.shared.saveContext()

            }, label: {
//                if favoriteChannelStatus.isFavorited {
                    Image(systemName: "star.fill")
//                } else {
//                    Image(systemName: "star")
//                }
            })

            Text("\(elapsedTime)")
            //elapsed time will come from player, by notification
        }
        .frame(width: 1000, height: 200, alignment: .center)
    }
}

struct VideoControlsOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoControlsOverlayView(mediaItemId: "")
    }
}
