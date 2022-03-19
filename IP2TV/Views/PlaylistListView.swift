//
//  PlaylistListView.swift
//  IP2TV
//
//  Created by Vinicius on 17/03/22.
//

import SwiftUI
import CoreData

struct PlaylistListView: View {
    @State var canNavigate: Bool = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Playlist.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Playlist.name, ascending: true),
        ]
    ) var playlists: FetchedResults<Playlist>
    
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    NavigationLink("Nova playlist", isActive: $canNavigate) {
                        AddPlaylistView(playlistName: "valendo", playlistUrl: "http://s.blueplay.me/zdpuFO")
                    }
                    NavigationLink("Limpar playlists (TBD)", isActive: $canNavigate) {
                        //AddPlaylistView(playlistName: "", playlistUrl: "")
                    }
                }.border(Color.green).frame(width: 600, height: 300, alignment: .center)
                List(playlists, id: \.id) { item in
                    VStack {
                        NavigationLink {
                            Categories_ChannelsView(mediaUrl: item.url ?? "")
                        } label: {
                            Text(item.name ?? "").foregroundColor(Color.green)
                            Text(item.url ?? "").foregroundColor(Color.green)
                        }.padding()

                    }
                }.border(Color.red).frame(width: 600, height: 400, alignment: .center)
            }.frame(width: 1500, height: 300, alignment: .center).border(Color.white)
        }
    }
}

struct PlaylistListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistListView()
    }
}
