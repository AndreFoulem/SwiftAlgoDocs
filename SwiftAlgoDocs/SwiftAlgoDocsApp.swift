//
//  SwiftAlgoDocsApp.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-10.
//

import SwiftUI

@main
struct SwiftAlgoDocsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
