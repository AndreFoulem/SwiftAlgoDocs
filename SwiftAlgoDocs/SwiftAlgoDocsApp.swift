//
//  SwiftAlgoDocsApp.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-10.
//
//** SAVE

import SwiftUI

@main
struct SwiftAlgoDocsApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
  
  #if os(OSX)
  @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
  #endif
  
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
      #if os(iOS)
        .onChange(of: scenePhase) { newScenePhase in
          if newScenePhase = .background {
            persistenceController.save()
          }
        }
      #endif
        .commands {
          CommandGroup(replacing: .saveItem) {
            Button("Save"){
              PersistenceController.shared.save()
            }
            .keyboardShortcut("S", modifiers: [.command])
          }
        }
    }
}

#if os(OSX)
class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationWillTerminate(_ notification: Notification) {
    PersistenceController.shared.save()
  }
  
  func applicationWillResignActive(_ notification: Notification) {
    PersistenceController.shared.save()
  }
  
}
#endif
