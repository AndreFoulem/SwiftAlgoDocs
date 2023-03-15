//
//  TextViewMacOSWrapper.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-15.
//

import SwiftUI


struct TextViewMacOSWrapper: NSViewRepresentable {
  let note: Note
  
  func makeCoordinator() -> Coordinator {
    Coordinator(note: note, parent: self)
  }
  
  func makeNSView(context: Context) -> NSTextView {
    let view = NSTextView()
    
    view.isRichText = true
    view.isEditable = true
    view.isSelectable = true
    view.allowsUndo = true
    
    view.usesInspectorBar = true
    view.usesFindPanel = true
    view.usesFindBar = true
    view.isRulerVisible = true
    
    view.delegate = context.coordinator
    return view
  }
  
  
  func updateNSView(_ nsView: NSTextView, context: Context) {
    nsView.textStorage?.setAttributedString(note.formattedBodyText)
    context.coordinator.note = note
  }
  
  class Coordinator: NSObject, NSTextViewDelegate {
    var note: Note
    var parent: TextViewMacOSWrapper
    
    init(note: Note, parent: TextViewMacOSWrapper) {
      self.note = note
      self.parent = parent
    }
    
    func textDidChange(_ notification: Notification) {
      if let textView = notification.object as? NSTextView {
        note.formattedBodyText = textView.attributedString()
      }
    }
  }
}

struct TextViewMacOSWrapper_Previews: PreviewProvider {
    static var previews: some View {
      TextViewMacOSWrapper(note: Note(title: "new", context: PersistenceController.preview.container.viewContext))
    }
}
