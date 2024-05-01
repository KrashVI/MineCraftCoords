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
    
    var body: some View {
        List {
            TextField("World Name: ", text: $bookmarkCreate.name)
            TextField("X Coordinate: ", _Double: $bookmarkCreate.XCoord)
            Button("Create World"){
                addBookmark(bookmarkCreate)
                
                dismiss()
            }
        }
    }
    func addBookmark(_ bookmarkCreate: Bookmark){
        context.insert(bookmarkCreate)
    }
}

#Preview {
    CreateBookmarkView()
}
