
import XCTest
import CoreData
import SwiftUI
@testable import SwiftAlgoDocs

final class KeywordTest: XCTestCase {
  
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
  
  func test_Keyword_hex_color() {
    let color = Color(red: 0, green: 0, blue: 1)
    
    let keyword = Keyword(context: context)
    keyword.colorHex = color
    
    let retreivedColor = keyword.colorHex
    print("DEBUG COLOR", retreivedColor)
    
    XCTAssertTrue(retreivedColor == color)
    
  }
}
