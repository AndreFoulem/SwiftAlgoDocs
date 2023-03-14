//
//  ContentView.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-10.
//

  import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Note.fetch(.all))
    private var notes: FetchedResults<Note>

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                     NoteDetailView(note: note)
                    } label: {
                      Text(note.creationDate!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addNote) {
                        Label("Add Note", systemImage: "plus")
                    }
                }
            }
            Text("Select a Note")
        }
    }

    private func addNote() {
      _ = Note(title: "New Note", context: viewContext)
    }

    private func deleteNotes(offsets: IndexSet) {
            offsets.map { notes[$0] }.forEach(viewContext.delete)
    }
  
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
