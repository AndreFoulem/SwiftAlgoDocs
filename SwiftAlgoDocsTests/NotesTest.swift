//
//  NotesTest.swift
//  SwiftAlgoDocsTests
//
//  Created by AndreMacBook on 2023-03-13.
//

import XCTest
import CoreData
@testable import SwiftAlgoDocs

final class NotesTest: XCTestCase {

    var controller: PersistenceController!
  
    var context: NSManagedObjectContext {
        controller.container.viewContext
    }
  
    override func setUpWithError() throws {
      self.controller = PersistenceController.createEmpty()
      
    }
    override func tearDownWithError() throws {
      self.controller = nil
    }

}
