//
//  w4_core_dataApp.swift
//  w4-core-data
//
//  Created by Default User on 9/25/24.
//

import SwiftUI

@main
struct w4_core_dataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
