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
      colorHex_ = newValue.toHex
    }
  }
  
  var color: Color {
    
    get { Color(red: red_, green: green_, blue: blue_, opacity: opacity_)}
    set {
      guard let components = newValue.cgColor?.components, components.count > 2 else {
        return }
        
        red_ = components[0]
        green_ = components[1]
        blue_ = components[2]
      
      if components.count == 4 {
        opacity_ = components[3]
      } else {
        opacity_ = 1.0
      }
        
        
     
    }
    
  }
  
  

}
