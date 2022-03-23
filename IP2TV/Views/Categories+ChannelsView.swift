//
//  Categories+Channels.swift
//  IP2TV
//
//  Created by Vinicius on 18/03/22.
//
// will display 2 colums, left colunm category, right column channels of given category
// swiftlint:disable line_length

import SwiftUI

// let parsed: [MediaItem]? =
//    try? ParseM3uFileToMediaItemList.parse(contentsData: Data(contentsOf: URL(string: "asdasd")!))!

struct CategoriesChannelsView: View {

    @State private(set) var mediaCategories: [MediaCategory] = []
    @State private(set) var mediaUrl: String = ""
    @State private(set) var channelsForSelectedCategory: [MediaItem] = []
    @State private(set) var isLoaderVisible: Bool = true

    var body: some View {
        NavigationView {

            ZStack {

                HStack {

                    VStack {
                        Text("Categorias").padding()
                        List(mediaCategories) { item in
                            Button(item.groupTitle) {
                                channelsForSelectedCategory = item.channels
                            }
                        }
                    }.border(.red, width: 10)

                    VStack {
                        Text("Canais disponíveis").padding()
                        List(channelsForSelectedCategory) { item in
                            NavigationLink("\(item.tvgName ?? "") - \(item.mediaUrl ?? "")", destination: {
                                VideoPlayerView(mediaItem: item)
                            })

                        }
                    }.border(.blue, width: 10)

                }.hidden(!isLoaderVisible)

                VStack {

                    ProgressView().scaleEffect(3.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                        .padding(.bottom, 80)
                    Text("Carregando lista de canais").font(.system(size: 48))
                    Text("Por favor aguarde...").font(.system(size: 48))

                }.hidden(isLoaderVisible)

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

extension View {
    @ViewBuilder func hidden(_ shouldShow: Bool) -> some View {
        switch shouldShow {
        case true: self
        case false:
            self.hidden()
        }
    }
}

#if DEBUG

struct CategoriesChannels_Previews: PreviewProvider {



    static var previews: some View {

        let contentsOfFile = "#EXTM3U\n#EXTINF:-1 tvg-id=\"Agromais.br\" tvg-name=\" A FAZENDA PRINCIPAL\" tvg-logo=\"https://u.udq.me/images/REALITY/A%20FAZENDA.png\" group-title=\"CANAIS | A FAZENDA\", A FAZENDA PRINCIPAL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128185\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24 NEWS\" tvg-logo=\"https://u.udq.me/images/NOTICIAS/24%20NEWS.png\" group-title=\"CANAIS | NOTÍCIAS\",24 NEWS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128152\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: AS AVENTURAS DE JACKIE CHAN\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: AS AVENTURAS DE JACKIE CHAN\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13225\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: BOB ESPONJA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: BOB ESPONJA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13207\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CAVALEIROS DOS ZODÍACOS\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CAVALEIROS DOS ZODÍACOS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13208\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CLÁSSICOS DISNEY\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CLÁSSICOS DISNEY\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13209\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORAGEM O CÃO CORVADE\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORAGEM O CÃO CORVADE\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13210\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORRIDA MALUCA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORRIDA MALUCA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13226\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DOIS HOMENS E MEIO\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24 HORAS\",24HS: DOIS HOMENS E MEIO\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DRAGON BALL\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: DRAGON BALL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13212\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FAMÍLIA DA PESADA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FAMÍLIA DA PESADA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13213\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FORMIGA ATÔMICA \" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FORMIGA ATÔMICA \r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n0,#EXTINF:-1 tvg-id=\"Agromais.br\" tvg-name=\" A FAZENDA PRINCIPAL\" tvg-logo=\"https://u.udq.me/images/REALITY/A%20FAZENDA.png\" group-title=\"CANAIS | A FAZENDA\", A FAZENDA PRINCIPAL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128185\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24 NEWS\" tvg-logo=\"https://u.udq.me/images/NOTICIAS/24%20NEWS.png\" group-title=\"CANAIS | NOTÍCIAS\",24 NEWS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/128152\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: AS AVENTURAS DE JACKIE CHAN\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: AS AVENTURAS DE JACKIE CHAN\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13225\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: BOB ESPONJA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: BOB ESPONJA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13207\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CAVALEIROS DOS ZODÍACOS\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CAVALEIROS DOS ZODÍACOS\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13208\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CLÁSSICOS DISNEY\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CLÁSSICOS DISNEY\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13209\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORAGEM O CÃO CORVADE\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORAGEM O CÃO CORVADE\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13210\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: CORRIDA MALUCA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: CORRIDA MALUCA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13226\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DOIS HOMENS E MEIO\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24 HORAS\",24HS: DOIS HOMENS E MEIO\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: DRAGON BALL\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: DRAGON BALL\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13212\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FAMÍLIA DA PESADA\" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FAMÍLIA DA PESADA\r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13213\r\n#EXTINF:-1 tvg-id=\"\" tvg-name=\"24HS: FORMIGA ATÔMICA \" tvg-logo=\"https://u.udq.me/images/VARIEDADES/1636549261200.png\" group-title=\"CANAIS | 24H DESENHOS\",24HS: FORMIGA ATÔMICA \r\nhttp://efv.me:80/ViniciusValvassori/j7SCr5/13211\r\n"

        let data = contentsOfFile.data(using: .utf8)
        let categs = ParseM3uFileToMediaItemList.parse(contentsData: data!)

        CategoriesChannelsView(mediaCategories: categs,
                               channelsForSelectedCategory: categs[2].channels,
                               isLoaderVisible: true)
    }
}
#endif
