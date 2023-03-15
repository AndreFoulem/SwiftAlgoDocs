//
//  TextViewiOSWrapper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-15.
//

import SwiftUI

struct TextViewiOSWrapper: UIViewRepresentable {
  
  let note: Note
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self, note: note)
  }
  
  func makeUIView(context: Context) -> UITextView {
    let view = UITextView()
    
    view.allowsEditingTextAttributes = true
    view.isEditable = true
    view.isSelectable = true
    view.font = UIFont.systemFont(ofSize: 20)
    
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.gray.cgColor
    view.layer.cornerRadius = 5
    
    view.textStorage.setAttributedString(note.formattedBodyText)
    
    view.delegate = context.coordinator
    return view
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.textStorage.setAttributedString(note.formattedBodyText)
    context.coordinator.note = note
  }
  
  class Coordinator: NSObject, UITextViewDelegate {
    
    var note: Note
    let parent: TextViewiOSWrapper
    
    init(_ parent: TextViewiOSWrapper, note: Note) {
      self.note = note
      self.parent = parent
    }
    
    func textViewDidChange(_ textView: UITextView) {
      note.formattedBodyText = textView.attributedText
    }
    
  }
  
   
}

struct TextViewiOSWrapper_Previews: PreviewProvider {
    static var previews: some View {
      TextViewiOSWrapper(note: Note(title: "title", context: PersistenceController.preview.container.viewContext))
    }
}
