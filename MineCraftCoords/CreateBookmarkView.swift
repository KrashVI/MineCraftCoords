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
    @State private var worldType = "OverWorld"
    let worldTypes = ["OverWorld", "Nether", "End"]
    @Binding var uniqueID: String
    
    var body: some View {
        List {
            TextField("World Name: ", text: $bookmarkCreate.name)
            TextField("X Coordinate: ", value: $bookmarkCreate.XCoord, format: .number)
            TextField("Y Coordinate: ", value: $bookmarkCreate.YCoord, format: .number)
            TextField("Z Coordinate: ", value: $bookmarkCreate.ZCoord, format: .number)
            Picker("Select a world", selection: $worldType){
                ForEach(worldTypes, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.menu)
        
            Button("Create Bookmark"){
                bookmarkCreate.matchingID = uniqueID
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
