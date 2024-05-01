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
    @Query var worlds: [Worlds]
    //@State var addWorld = Worlds()
    @State private var worldName = ""
    @State private var showingWorldCreate = false
    @State private var showingBookmarks = false
    
    var body: some View {
        VStack {
            ZStack{
                Image("minecraft-bedrock-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(Text("My Worlds")
                        .foregroundColor(.yellow)
                        .font(.custom("Minecraft Regular", size: 46)), alignment: .bottom)
                
            }
            //Text("My Worlds")
            //Divider()
            NavigationStack{
                VStack{
                    ZStack{
                        List{
                            ForEach(worlds){world in
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text(world.name)
                                            .font(.custom("Minecraft Regular", size: 28))
                                            .bold()
                                        //                                        Text("\(world.timeCreated, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                                        
                                    }
                                }
                                .swipeActions{
                                    Button(role: .destructive)
                                    {
                                        withAnimation
                                        {
                                            context.delete(world)
                                        }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                            .symbolVariant(.fill)
                                    }
                                }
                            }
                        }
                        //Text(Worlds.name)
                            .toolbar{
                                ToolbarItem{
                                    Button(action: showWorldCreate){
                                        Text("Add World")
                                    }
                                    .buttonStyle(.bordered)
                                }
                            }
                            .sheet(isPresented: $showingWorldCreate, content: {
                                NavigationStack{
                                    CreateWorldView()
                                }
                                .presentationDetents([.medium])
                            })
                    }
                }
                Spacer()
            }
        }
    }
    func showWorldCreate(){
        showingWorldCreate = true
    }
}

// We need a CSV file for saved worlds
// Nether to OverWorld and OverWorld to Nether converter needs to be a function (1:8 and 8:1) "Portal Estimator"?
// Add a plus button for adding a new world on main menu, and adding a new coordinate on the subsequent inner worlds
// Delete function for World and Modify/Delete for inner world coordinates
#Preview {
    ContentView()
        .modelContainer(for: Worlds.self)
}
