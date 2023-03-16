//
//  NotePhotoSelectorButton.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-16.
//

import SwiftUI
import PhotosUI

struct NotePhotoSelectorButton: View {
    @ObservedObject var note: Note
  
  @State private var selectedItem: PhotosPickerItem? = nil
  
    var body: some View {
      PhotosPicker(selection: $selectedItem,
                   matching: .images,
                   photoLibrary: .shared()) {
        note.img == nil ?
        Text("import an image")
        : Text("ChangePhoto")
     
      }
      .onChange(of: selectedItem) { newValue in
                     Task {
                       if let data = try? await newValue?.loadTransferable(type: Data.self) {
                         note.img = data
                       }
                     }
                   }
      
    }
}

struct NotePhotoSelectorButton_Previews: PreviewProvider {
    static var previews: some View {
      NotePhotoSelectorButton(note: Note(title: "new", context: PersistenceController.preview.container.viewContext))
    }
}
