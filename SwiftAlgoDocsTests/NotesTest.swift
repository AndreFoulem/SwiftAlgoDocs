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
  
    func test_Notes_Creation() {
        let noteTitle = "new"
        let note = Note(title: noteTitle, context: context)
      
        XCTAssertTrue(
          note.title == noteTitle,
          "Note should have the title given in the convenience initializer")
    }
  
    func test_Notes_CreationDate() {
      let note = Note(context: context)
      
      let noteConvenienceInit = Note(title: "new", context: context)
      
      XCTAssertNotNil(noteConvenienceInit.creationDate,
      "note should have creationDateProperty")
      
      XCTAssertNotNil(note.creationDate,
      "note should have creationDateProperty")
      
    }

}
