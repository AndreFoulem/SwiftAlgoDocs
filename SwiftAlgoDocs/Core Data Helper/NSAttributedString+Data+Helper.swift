//
//  NSAttributedString+Data+Helper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-15.
//

import Foundation

extension NSAttributedString {
  
  func toData() -> Data? {
    
    let options: [NSAttributedString.DocumentAttributeKey: Any] = [.documentType: NSAttributedString.DocumentType.rtf, .characterEncoding: String.Encoding.utf8]
    
    let range = NSRange(location: 0, length: length)
    
    let result = try? data(from: range, documentAttributes: options)
    
    return result
  }
}

extension Data {
  func toAttributedString() -> NSAttributedString? {
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.rtf, .characterEncoding: String.Encoding.utf8]
    
     let result = try? NSAttributedString(data: self,  options: options, documentAttributes: nil)
    
    return result
  }
}
