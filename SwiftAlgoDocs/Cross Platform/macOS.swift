//
//  File.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-16.
//

import SwiftUI

typealias UIImage = NSImage

extension Image {
  init(uiImage: UIImage) {
    self.init(nsImage: uiImage)
  }
}

