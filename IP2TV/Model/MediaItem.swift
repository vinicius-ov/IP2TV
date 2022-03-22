//
//  MediaItem.swift
//  IP2TV
//
//  Created by Vinicius on 16/03/22.
//

import Foundation

class MediaItem: Identifiable, CustomStringConvertible {
    var description: String {
        return "name=\(tvgName ?? "")\nurl=\(mediaUrl ?? "nada")\ntvgid=\(tvgId ?? "")"
    }

    var id: String
    var extInf: Int?
    var tvgId: String?
    var tvgName: String?
    var tvgLogo: String?
    var groupTitle: String?
    var mediaUrl: String?

    func build(_ infos: [String]) {
        self.extInf = -1 // needed?
        self.tvgId = infos[1]
        self.tvgName = infos[3]
        self.tvgLogo = infos[5]
        self.groupTitle = infos[7]
    }

    init() {
        self.id = UUID().uuidString
    }

    func isChannel() -> Bool {
        return mediaUrl != nil && tvgName != nil
    }
}
