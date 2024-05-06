//
//  CreateWorldView.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/29/24.
//

import SwiftUI
import SwiftData

struct CreateBookmarkView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var bookmarkCreate = Bookmark()
    @Binding var worldID: String
    
    var body: some View {
        List {
            TextField("World Name: ", text: $bookmarkCreate.name)
            //TextField("X Coordinate: ", text: $bookmarkCreate.XCoord)
            Button("Create World"){
                bookmarkCreate.ID = worldID
                addBookmark(bookmarkCreate)
                
                dismiss()
            }
        }
    }
    func addBookmark(_ bookmarkCreate: Bookmark){
        context.insert(bookmarkCreate)
    }
}

//#Preview {
//    CreateBookmarkView()
//        .modelContainer(for: [Worlds.self, Bookmark.self])
//}
