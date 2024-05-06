//
//  WorldView.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 5/1/24.
//

import SwiftUI
import SwiftData

struct WorldView: View {
    
    @Environment(\.modelContext) var context
    @Query var bookmarks: [Bookmark]
    @State var createBookmark = Bookmark()
    @State private var showBookmarkCreate = false
    @Binding var worldID: String
    
    var body: some View {
        
        
        Text("World View WORKS!")
        NavigationStack{
            VStack{
                ZStack{
                    List{
                        ForEach($bookmarks.bookmark, id: \.worldID){bookmark in
                            VStack{
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text(bookmark.name)
                                            .font(.custom("Minecraft Regular", size: 28))
                                            .bold()
                                        Text(bookmark.worldID)
                                    }
                                }
                            }
                            .swipeActions{
                                Button(role: .destructive)
                                {
                                    withAnimation
                                    {
                                        context.delete(bookmark)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .symbolVariant(.fill)
                                }
                            }
                        }
                    }
                    .toolbar{
                        ToolbarItem{
                            Button(action: BookmarkCreate){
                                Text("Add Bookmark")
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .sheet(isPresented: $showBookmarkCreate, content: {
                        NavigationStack{
                            CreateBookmarkView(worldID: $worldID)
                        }
                        .presentationDetents([.medium])
                    })
                }
            }
            Spacer()
        }
    }
    func BookmarkCreate(){
        showBookmarkCreate = true
    }
}

//#Preview {
//    WorldView()
//        .modelContainer(for: [Worlds.self, Bookmark.self])
//}
