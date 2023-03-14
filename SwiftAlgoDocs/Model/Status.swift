//
//  Status.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-14.
//

import Foundation

enum Status: String, Identifiable, CaseIterable {
  case draft = "Draft"
  case review = "Review"
  case archived = "Archived"
  
  var id: String {
    return self.rawValue
  }
}
