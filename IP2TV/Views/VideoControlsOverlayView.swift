//
//  VideoControlsOverlayView.swift
//  IP2TV
//
//  Created by Vinicius Valvassori on 3/23/22.
//

import SwiftUI

struct VideoControlsOverlayView: View {

    @State var isPlaying: Bool = true
    @State private var elapsedTime = 0
    @State private var isMute: Bool = false
    @State private var mediaItem: MediaItem?
    //@State private var favoriteChannelStatus: FavoriteChannelStatus
    @State private var isFavorited: Bool = false
    @State private var favoritedChannel: FavoriteChannel?

    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest var fetchedChannels: FetchedResults<FavoriteChannel>

    init(mediaItemId: String) {
        _fetchedChannels = FetchRequest(sortDescriptors: [],
                                       predicate: NSPredicate(format: "id == %@", mediaItemId)
        )
        _favoritedChannel.wrappedValue = _fetchedChannels.wrappedValue.first
        _isFavorited.wrappedValue = _fetchedChannels.wrappedValue.isEmpty
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

                if !isFavorited {
                    let favoriteChannel = FavoriteChannel(context: managedObjectContext)
                    favoriteChannel.id = UUID()
                    favoriteChannel.tvgName = mediaItem?.tvgName ?? ""
                    favoriteChannel.mediaUrl = mediaItem?.mediaUrl ?? ""
                    favoritedChannel = favoriteChannel
                    isFavorited = true
                } else {
                    guard let channel = favoritedChannel else { return }
                    managedObjectContext.delete(channel)
                    isFavorited = true
                }
                PersistenceController.shared.saveContext()

            }, label: {
                if isFavorited {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
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
