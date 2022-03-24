//
//  MediaCategory.swift
//  IP2TV
//
//  Created by Vinicius on 22/03/22.
//

import UIKit

class MediaCategory: Identifiable {

    var id: String
    var groupTitle: String
    var channels: [MediaItem]

    init(mediaItem: MediaItem) {
        self.id = UUID().uuidString
        self.groupTitle = mediaItem.groupTitle ?? "Uncategorized"
        self.channels = []
        self.channels.append(mediaItem)
    }

}
