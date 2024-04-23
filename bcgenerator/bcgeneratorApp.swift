//
//  bcgeneratorApp.swift
//  bcgenerator
//
//  Created by PowerMac on 23.04.2024.
//

import SwiftUI

@main
struct bcgeneratorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
