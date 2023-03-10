//
//  Persistence.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-10.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

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

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "SwiftAlgoDocs")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
             
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
      //-> ICLOUD LINE
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
  

}
