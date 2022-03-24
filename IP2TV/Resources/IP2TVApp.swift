//
//  IP2TVApp.swift
//  IP2TV
//
//  Created by Vinicius on 16/03/22.
//

import SwiftUI

@main
struct IP2TVApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { _ in
            persistenceController.saveContext()
        }
    }
}
