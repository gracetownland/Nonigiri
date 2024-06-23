//
//  ContentView.swift
//  nonigiri
//
//  Created by Ayush S on 2024-06-22.
//

import SwiftUI

struct ContentView: View {
    private var statusItem: NSStatusItem!
    @State private var speed = 5.0
    @State private var isEditing = false
    var body: some View {
        VStack{
            Slider(
                        value: $speed,
                        in: 0...120,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
//                    Text("\(speed)")
//                        .foregroundColor(isEditing ? .red : .blue)
            //Text("SLIDER")
            HStack{
                Button("5m") {
                    speed = 5
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("10m") {
                    speed = 10
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("25m") {
                    speed = 25
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding()
            }
            HStack{
                Button("Start"){
                    speed+=speed
                }
                .buttonStyle(.accessoryBar)
                .padding(10)
    
                Spacer()
                Text("\(Int(speed))").bold().font(.system(size: 30))
            }
        }
    }
}

#Preview {
    ContentView()
}
