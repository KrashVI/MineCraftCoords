//
//  ContentView.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @Query var worlds: [Bookmark]
    @State var addWorld = Worlds()
    @State private var worldName = ""
    @State private var showingWorldCreate = false
    @State private var showingBookmarks = false
    
    var body: some View {
        VStack {
            ZStack{
                Image("minecraft-bedrock-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(Text("Coordinates")
                        .foregroundColor(.yellow)
                        .font(.custom("Minecraft Regular", size: 46)), alignment: .bottom)
                
            }
            Text("My Worlds")
            Divider()
            NavigationStack{
                VStack{
                    ZStack{
                        Text("")
                            .toolbar{
                                ToolbarItem{
                                    Button(action: {
                                        showingWorldCreate = true
                                    }, label: {
                                        Label("Add World", systemImage: "plus")
                                    })
                                    .buttonStyle(.bordered)
                                    .popover(isPresented: $showingWorldCreate, content: {
                                        TextField("Give your world a name:", text: $worldName)
                                    })
                                }
                            }
                    }
                }
                Spacer()
            }
        }
    }
}
// We need a CSV file for saved worlds
// Nether to OverWorld and OverWorld to Nether converter needs to be a function (1:8 and 8:1) "Portal Estimator"?
// Add a plus button for adding a new world on main menu, and adding a new coordinate on the subsequent inner worlds
// Delete function for World and Modify/Delete for inner world coordinates
#Preview {
    ContentView()
        .modelContainer(for: [Worlds.self, Bookmark.self])
}
