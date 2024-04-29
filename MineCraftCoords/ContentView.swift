//
//  ContentView.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/24/24.
//

import SwiftUI
import SwiftData

//struct World{
//    public var overWorld: [OverWorldCoord]
//    public var theNether: [NetherCoord]
//    public var theEnd: [TheEndCoord]
//}

struct OverWorldCoord{
    public var x: Double
    public var y: Double
    public var z: Double
    public var name: String
}

struct NetherCoord{
    public var x: Double
    public var y: Double
    public var z: Double
    public var name: String
}

struct TheEndCoord{
    public var x: Double
    public var y: Double
    public var z: Double
    public var name: String
}

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @Query var worlds: [World]
    @State private var addWorld = false
    
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
                                        addWorld.toggle()
                                    }, label: {
                                        Label("Add World", systemImage: "plus")
                                    })
                                    .buttonStyle(.bordered)
                                }
                            }
                            //.sheet(isPresented: $addWorld)
                        //Text("Worlds popuate here*")
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
}
