//
//  Persistence.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-10.
//

import CoreData
import Combine
import CloudKit

class PersistenceController: ObservableObject {
    static let shared = PersistenceController()
  
    let container: NSPersistentCloudKitContainer
    var subscriptions = Set<AnyCancellable>()
  
  @Published var syncErrorMessage: String? = nil
  

    //MARK: - SwiftUI Preview Helper
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        return result
    }()



    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "SwiftAlgoDocs")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
       //-* ELSE persistent
        } else {
          #if DEBUG
          setupSchemaSync()
          #endif
          
        }
      
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
      //-> ICLOUD LINE
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
      
        checkSyncStatus()
    }
}

extension PersistenceController {
  
  func setupSchemaSync() {
    let options = NSPersistentCloudKitContainerSchemaInitializationOptions()
    
    do {
      try container.initializeCloudKitSchema(options: options)
    } catch {
      print("Could kit initializeCloudKitSchema + options fail")
    }
  }
  
  func checkSyncStatus() {
    NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)
      .sink { notification in
        
        guard let event = notification.userInfo?[NSPersistentCloudKitContainer.eventNotificationUserInfoKey] as? NSPersistentCloudKitContainer.Event else { return }
        
        if event.endDate == nil {
          print("")
        } else {
          switch event.type {
            case .setup: print("cloudkit - event finished")
            case .import: print("cloudkit - event import")
            case .export: print("Cloudkit  - event export")
            @unknown default:
              print("cloudkitevent - added a new event type")
          }
          
          if  event.succeeded {
            print("cloudkit - event succeeded")
          } else {
            print("cloudkit - not succeeded")
          }
          if let error = event.error as? CKError {
            print("cloudkit event - errror \(error.localizedDescription)")
//            switch error.code {
//              case .quotaExceeded:
//                self.syncErrorMessage = " quota exceeded, please free up case on Icloud"
//                print("quota exceeded, please free up case on Icloud")
//
//            }
            
             // error.code = .networkfailure
            // CODE 3
          }
        }
        
      
      }
      .store(in: &subscriptions)
  }
  
  
  
}
