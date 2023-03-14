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

    var container: NSPersistentContainer!
  
    var context: NSManagedObjectContext {
      container.viewContext
    }
  
    override func setUpWithError() throws {
          
      
    }

    override func tearDownWithError() throws {
  
    }

}
