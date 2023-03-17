
import XCTest
import CoreData
import SwiftUI
@testable import SwiftAlgoDocs

final class ColorTest: XCTestCase {
  
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
  
  func test_Hex_to_Color() {
    
    let colorBlue = Color(hex: "0000FF")
    let colorBlueAlpha = Color(hex: "0000FFFF")
    let num = 1
    let num2 = 1
    
    let blue = Color(red: 0, green: 0, blue: 1)
    
    XCTAssertTrue(blue == colorBlue)
    XCTAssertTrue(blue == colorBlueAlpha)
    
    XCTAssertTrue(num == num2)
  }
  
  func test_Color_to_Hex() {
    
    let blues = Color(red: 0, green: 0, blue: 1)

    let hex = blues.toHex
    
    XCTAssertTrue(hex == "0000FFFF")
    
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
