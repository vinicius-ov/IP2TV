//
//  PlaylistService.swift
//  IP2TV
//
//  Created by Vinicius on 18/03/22.
//

import Foundation

protocol PlaylistServiceCrud {
    func create(playList: Playlist)
    func recover() -> [Playlist]
    func update(playlist: Playlist)
    func delete(playlist: Playlist)
}

struct PlaylistService: PlaylistServiceCrud {

    func create(playList: Playlist) {

    }

    func recover() -> [Playlist] {
        return []
    }

    func update(playlist: Playlist) {

    }

    func delete(playlist: Playlist) {

    }

}
