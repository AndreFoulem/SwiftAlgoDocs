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

      VStack(spacing:20) {
        
        Text("Note Detail View")
       
        TextField("title", text: $note.title)
          .textFieldStyle(.roundedBorder)
        // $note.status -> Get [$note.status get the status_ and transform to status enum ] Set [ Set the newValue.rawValue to status_ string ]
        Picker(selection: $note.status) {
          ForEach(Status.allCases) { status in
            Text(status.rawValue)
            //add a .tag to have the picker selectable on rawValue
              .tag(status)
          }
        } label: {
          Text("Note's Status")
        }
        .pickerStyle(.segmented)
        
        #if os(iOS)
        TextViewiOSWrapper(note: note)
        #else
        TextViewMacOSWrapper(note: note)
        #endif
        
        OptionalmageView(data: note.img)
        
        NotePhotoSelectorButton(note: note)
        
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
