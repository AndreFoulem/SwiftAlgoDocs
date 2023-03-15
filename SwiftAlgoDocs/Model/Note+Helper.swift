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
  //** Syntaxic sugar - Handle the optional
  var title: String {
    get { self.title_ ?? "" }
    set { self.title_ = newValue }
  }
  
  //-> Convert the status_ string optional from db -> return init Status enum with status_ string
  //-> if status_ is nil -> return init Status with .draft
  var status: Status {
    get {
      if let rawStatus = status_ ,
         let status = Status(rawValue: rawStatus) {
        return status
      } else { return Status.draft }
    }
    //-> Convert enum to db as status_ (String)
    set {
      status_ = newValue.rawValue
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
      //get context
    guard let context = note.managedObjectContext else {return}
  
    context.delete(note)
  }
  
  static func asyncSave() {
    //TODO
  }
  
  
}
