//
//  NotePhotoSelectorButton.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-16.
//

import SwiftUI
import PhotosUI

struct NotePhotoSelectorButton: View {
    let note: Note
  
  @State private var selectedItem: PhotosPickerItem? = nil
  
    var body: some View {
      PhotosPicker(selection: $selectedItem,
                   matching: .images,
                   photoLibrary: .shared()) {
        Text("import an image")
      }
      
    }
}

struct NotePhotoSelectorButton_Previews: PreviewProvider {
    static var previews: some View {
      NotePhotoSelectorButton(note: Note(title: "new", context: PersistenceController.preview.container.viewContext))
    }
}
