//
//  ContentView.swift
//  nonigiri
//
//  Created by Ayush S on 2024-06-22.
//

import SwiftUI
import ModernSlider

struct ContentView: View {
    @State private var setTime = 5.0
    @State private var isEditing = false
    let mainScreen = NSScreen.main
    
    var body: some View {
        VStack{
            ModernSlider(
                "Time",
                systemImage: "deskclock",
                sliderWidth: 200,
                sliderHeight: 30,
                sliderColor: .white,
                value: Binding(
                    get: {setTime/1.2},
                    set: {setTime = $0 * 1.2}
                    )
                )
            

            HStack{
                Button("5m") {
                    setTime = 5
                    //start timer
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("10m") {
                    setTime = 10
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("25m") {
                    setTime = 25
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding()
            }
            HStack{
                Button("Start"){
                    setTime = (setTime < 120) ? setTime + setTime : 120
                }
                .buttonStyle(.accessoryBar)
                .padding(10)
    
                Spacer()
                Text("\(Int(setTime))").bold().font(.system(size: 30))
            }
        }
    }
}

#Preview {
    ContentView()
}
