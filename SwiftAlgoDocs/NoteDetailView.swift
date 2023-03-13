//
//  NoteDetailView.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-12.
//

import SwiftUI

struct NoteDetailView: View {
  let note: Note
  
    var body: some View {
      VStack(spacing:20) {
        Text("Note Detail View")
        
        HStack {
          Text("Title: ")
          if let title = note.title {
            Text(title)
          }
        }
        Button("Delete Note") {
          let context = note.managedObjectContext
          context?.delete(note)
        }
        .foregroundColor(.pink)
      }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
      let context = PersistenceController.preview.container.viewContext
      let note = Note(title: "new note", context: context)
     
      
      return NoteDetailView(note: note)
        .environment(\.managedObjectContext, context)
    }
}
