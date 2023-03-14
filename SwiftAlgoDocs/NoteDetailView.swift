//
//  NoteDetailView.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-12.
//

import SwiftUI

struct NoteDetailView: View {
  @ObservedObject var note: Note
  
  @State var status: Status = .draft

    var body: some View {
//      let textBinding = Binding(
//        get: { note.title ?? "" },
//        set: { note.title = $0 }
//      )
      
   
      return VStack(spacing:20) {
        Text("Note Detail View")
        Text("Order \(note.order)")
        HStack {
          Text("Title: ")
          Text(note.title)
        }
        
        Picker(selection: $status) {
          ForEach(Status.allCases) { status in
            Text(status.rawValue)
            //add a .tag to have the picker selectable on rawValue
              .tag(status)
          }
        } label: {
          Text("Note's Status")
        }
        .pickerStyle(.segmented)

        
        TextField("title", text: $note.title)
          .textFieldStyle(.roundedBorder)
        
        Button("clear title") {
          note.title = ""
        }
        
        
        
        Button("Delete Note") {
          let context = note.managedObjectContext
          context?.delete(note)
        }
        .foregroundColor(.pink)
      }//vs
      .padding()
      
      .onDisappear {
        PersistenceController.shared.save()
      }
      
    }//body
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
      let context = PersistenceController.preview.container.viewContext
      let note = Note(title: "new note", context: context)
     
      
      return NoteDetailView(note: note)
        .environment(\.managedObjectContext, context)
    }
}
