//
//  Note+Helper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-12.
//

import Foundation
import CoreData

extension Note {
  
  //-> move the Binding from body view to this property
  //** Syntaxic sugar
  var title: String {
    get {
      self.title_ ?? ""
    }
    set {
      self.title_ = newValue
    }
  }
  
  
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
  
  //-> .all is a static property on NSPredicate extension
  static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<Note> {
    let request = NSFetchRequest<Note>(entityName: "Note")
    request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.creationDate, ascending: true)]
    request.predicate = predicate
    
    return request
  }
  
  static func delete(note: Note) {
    //TODO
  }
  
}
