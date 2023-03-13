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
  }
  
  public override func awakeFromInsert() {
    self.creationDate = Date()
  }
  
}
