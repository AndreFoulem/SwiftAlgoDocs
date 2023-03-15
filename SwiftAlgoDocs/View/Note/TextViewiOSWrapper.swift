//
//  TextViewiOSWrapper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-15.
//

import SwiftUI

struct TextViewiOSWrapper: UIViewRepresentable {
  
  let note: Note
  
  func makeUIView(context: Context) -> UITextView {
    let view = UITextView()
    
    view.allowsEditingTextAttributes = true
    view.isEditable = true
    view.isSelectable = true
    view.font = UIFont.systemFont(ofSize: 20)
    
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.gray.cgColor
    view.layer.cornerRadius = 5
    
    view.textStorage.setAttributedString(NSAttributedString)
    
    return view
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    
  }
  
   
}

//struct TextViewiOSWrapper_Previews: PreviewProvider {
//    static var previews: some View {
//        TextViewiOSWrapper()
//    }
//}
