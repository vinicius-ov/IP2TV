//
//  Rabiola.swift
//  IP2TV
//
//  Created by Vinicius on 17/03/22.
//

import SwiftUI

struct AddPlaylistView: View {
    @State var playlistName: String
    @State var playlistUrl: String
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Nova playlist").font(.system(size: 50)).padding()
            TextField("Nome da Playlist", text: $playlistName)
            TextField("URL da playlist (ex: http://www.example.com/playlist)", text: $playlistUrl)
            Button("Salvar") {
                guard !playlistName.isEmpty, !playlistUrl.isEmpty else {
                    print("valores vazios")
                    return
                }
                
                let playlist: Playlist = Playlist(context: managedObjectContext)
                playlist.id = UUID()
                playlist.name = playlistName
                playlist.url = playlistUrl
                PersistenceController.shared.saveContext()
                presentationMode.wrappedValue.dismiss()
            }.padding()
        }
    }
}

struct AddPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaylistView(playlistName: "abc", playlistUrl: "http://www.example.com/playlist")
    }
}
