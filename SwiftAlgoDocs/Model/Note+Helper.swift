//
//  Note+Helper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-12.
//

import Foundation
import CoreData

extension Note {
  convenience init(title: String, context: NSManagedObjectContext) {
    self.init(context: context)
    self.title = title
    
    do {
      try context.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
  }
  
  public override func awakeFromInsert() {
    self.creationDate = Date()
  }
  
}
