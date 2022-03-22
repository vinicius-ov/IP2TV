//
//  ParseM3uFileToMediaItemList.swift
//  IP2TV
//
//  Created by Vinicius on 18/03/22.
//
//  swiftlint:disable all

import Foundation

struct ParseM3uFileToMediaItemList {
    
    static func parse(contentsData: Data) -> [MediaItem]? {
        guard let contentsOfFile: String = String(data: contentsData, encoding: .utf8)
        else {
            return []
        }
        
        var mediaItems = [MediaItem]()
        let lines = contentsOfFile.components(separatedBy: "\n")
        for index in stride(from: 1, to: lines.count-1, by: 2) {
            let mediaItem: MediaItem = MediaItem()
            
            print(index)
            
            let infos = Array(lines[index].components(separatedBy: "\""))
            mediaItem.build(infos)
            mediaItem.mediaUrl = lines[index+1].replacingOccurrences(of: "\r", with: "")
            
            mediaItems.append(mediaItem)
        }
        
        return mediaItems
    }

    
    static func parse() -> [MediaItem]? {
        //            guard let contentsOfFile: String = String(data: contentsData, encoding: .utf8)
        //            else {
        //                return []
        //            }
        
        let contentsOfFile = "#EXTM3U\n#EXTINF:-1 tvg-id=\"Agromais.br\" tvg-name=\" A FAZENDA PRINCIPAL\" tvg-logo=\"https://u.udq.me/images/REALITY/A%20FAZENDA.png\" group-title=\"CANAIS | A FAZENDA\", A FAZENDA PRINCIPAL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128185\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24 NEWS\" tvg-logo=\"https://u.udq.me/images/NOTICIAS/24%20NEWS.png\" group-title=\"CANAIS | NOTÍCIAS\",24 NEWS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128152\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: AS AVENTURAS DE JACKIE CHAN\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: AS AVENTURAS DE JACKIE CHAN\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13225\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: BOB ESPONJA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: BOB ESPONJA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13207\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CAVALEIROS DOS ZODÍACOS\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CAVALEIROS DOS ZODÍACOS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13208\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CLÁSSICOS DISNEY\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CLÁSSICOS DISNEY\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13209\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORAGEM O CÃO CORVADE\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORAGEM O CÃO CORVADE\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13210\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORRIDA MALUCA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORRIDA MALUCA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13226\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DOIS HOMENS E MEIO\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24 HORAS\",24HS: DOIS HOMENS E MEIO\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DRAGON BALL\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: DRAGON BALL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13212\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FAMÍLIA DA PESADA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FAMÍLIA DA PESADA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13213\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FORMIGA ATÔMICA \" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FORMIGA ATÔMICA \r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n0,#EXTINF:-1 tvg-id=\"Agromais.br\" tvg-name=\" A FAZENDA PRINCIPAL\" tvg-logo=\"https://u.udq.me/images/REALITY/A%20FAZENDA.png\" group-title=\"CANAIS | A FAZENDA\", A FAZENDA PRINCIPAL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128185\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24 NEWS\" tvg-logo=\"https://u.udq.me/images/NOTICIAS/24%20NEWS.png\" group-title=\"CANAIS | NOTÍCIAS\",24 NEWS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128152\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: AS AVENTURAS DE JACKIE CHAN\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: AS AVENTURAS DE JACKIE CHAN\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13225\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: BOB ESPONJA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: BOB ESPONJA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13207\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CAVALEIROS DOS ZODÍACOS\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CAVALEIROS DOS ZODÍACOS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13208\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CLÁSSICOS DISNEY\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CLÁSSICOS DISNEY\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13209\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORAGEM O CÃO CORVADE\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORAGEM O CÃO CORVADE\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13210\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORRIDA MALUCA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORRIDA MALUCA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13226\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DOIS HOMENS E MEIO\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24 HORAS\",24HS: DOIS HOMENS E MEIO\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DRAGON BALL\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: DRAGON BALL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13212\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FAMÍLIA DA PESADA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FAMÍLIA DA PESADA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13213\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FORMIGA ATÔMICA \" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FORMIGA ATÔMICA \r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n"
        
        var mediaItems = [MediaItem]()
        let lines = contentsOfFile.components(separatedBy: "\n")
        for index in stride(from: 1, to: lines.count-1, by: 2) {
            let mediaItem: MediaItem = MediaItem()
            
            print(index) 
            
            let infos = Array(lines[index].components(separatedBy: "\""))
            mediaItem.build(infos)
            mediaItem.mediaUrl = lines[index+1]
           
            
            print(lines[index])
            print(lines[index+1])
            
            mediaItems.append(mediaItem)
        }
        
        return mediaItems
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
