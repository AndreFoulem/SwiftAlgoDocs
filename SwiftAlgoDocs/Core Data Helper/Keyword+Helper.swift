//
//  Keyword+Helper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-17.
//

import SwiftUI

extension Keyword {

  var colorHex: Color {
    get {
      if let colorHexValue = colorHex_,
         let color = Color(hex: colorHexValue) {
        return color
      } else {
        return Color.black
      }
    }
    set {
      // newValue


    }
  }

}
