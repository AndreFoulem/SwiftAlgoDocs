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
  
  func test_Notes_Updating_Title() {
    let note = Note(title: "old", context: context)
    note.title = "new"
    
    XCTAssertTrue(note.title == "new",
    "updated the title to new")
  }
  
  func test_Fetch_All_Notes() {
    _ = Note(title: "default", context: context)
    let fetch = Note.fetch(.all)
    let fetchedNotes = try? context.fetch(fetch)
    
    XCTAssertNotNil(fetchedNotes)
    XCTAssertTrue(fetchedNotes!.count > 0
      ,"Predicate should fetch all objects")
  }
  
  func test_Fetch_None_Predicate() {
    _ = Note(title: "default", context: context)
    let fetch = Note.fetch(NSPredicate.none)
    let fetchedNotes = try? context.fetch(fetch)
    
    XCTAssertNotNil(fetchedNotes)
    XCTAssertTrue(fetchedNotes!.count == 0,
      "Predicate of none should not fetch any objects")
  }
  
  func test_Delete_Note() {
    let note = Note(title: "default note", context: context)
    
    Note.delete(note: note)
    
    let fetchedNotes = try? context.fetch(Note.fetch(.all))
    
    XCTAssertTrue(fetchedNotes?.count == 0,
    "deleted note should not be in database")

    XCTAssertFalse(fetchedNotes!.contains(note),
    "deleted note should not be in database")
  }
  
  func test_Asynchronous_Save() {
    
    expectation(forNotification: .NSManagedObjectContextDidSave, object: context) { _ in
      return true
    }
    _ = Note(title: "default note", context: context)

    controller.save()
    
    waitForExpectations(timeout: 2.0) { error in
      XCTAssertNil(error, "saving did work")
    }
  }
  


}
