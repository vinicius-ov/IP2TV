//
//  ParseM3uFileToMediaItemList.swift
//  IP2TV
//
//  Created by Vinicius on 18/03/22.
//

import Foundation

struct ParseM3uFileToMediaItemList {

    static func parse(contentsData: Data) -> [MediaCategory] {
                    guard let contentsOfFile: String = String(data: contentsData, encoding: .utf8)
                    else {
                        return []
                    }

        var mediaCategories = [MediaCategory]()
        let lines = contentsOfFile.components(separatedBy: "\n")
        for index in stride(from: 1, to: lines.count-1, by: 2) {
            let mediaItem: MediaItem = MediaItem()

            let infos = Array(lines[index].components(separatedBy: "\""))
            mediaItem.build(infos)
            mediaItem.mediaUrl = lines[index+1]

            var added = false

            if mediaCategories.isEmpty {
                let firstCategory = MediaCategory(mediaItem: mediaItem)
                mediaCategories.append(firstCategory)
            } else {
                for category in mediaCategories where category.groupTitle == (mediaItem.groupTitle ?? "") {
                    category.channels.append(mediaItem)
                    added = true
                }
                if !added {
                    let firstCategory = MediaCategory(mediaItem: mediaItem)
                    mediaCategories.append(firstCategory)
                    added = false
                }
            }
        }

        return mediaCategories
    }

}

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }

        return self[index]
    }
}
