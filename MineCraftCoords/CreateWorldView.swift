//
//  CreateWorldView.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/29/24.
//

import SwiftUI
import SwiftData

struct CreateWorldView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var worldCreate = Worlds()
    var id: String = UUID().uuidString
    
    var body: some View {
        List {
            TextField("World Name: ", text: $worldCreate.name)
            Button("Create World"){
                worldCreate.worldID = id
                addWorld(worldCreate)
                
                dismiss()
            }
        }
    }
    func addWorld(_ worldCreate: Worlds){
        context.insert(worldCreate)
    }
}

#Preview {
    CreateWorldView()
        .modelContainer(for: [Worlds.self, Bookmark.self])
}
