//
//  ContentView.swift
//  nonigiri
//
//  Created by Ayush S on 2024-06-22.
//

import SwiftUI
import ModernSlider
import Foundation



struct ContentView: View {
    @State var setTime = 5.0
    @State private var isEditing = false
    let mainScreen = NSScreen.main
    var body: some View {

        VStack{
            let timerHelper = TimerHelper(setTime: setTime)

            ModernSlider(
                "Time",
                systemImage: "deskclock",
                sliderWidth: 300,
                sliderHeight: 30,
                sliderColor: .white,
                value: Binding(
                    get: {setTime/1.2},
                    set: {setTime = $0 * 1.2}
                    )
                )
            .padding(.top)
            

            HStack{
                Button("5m") {
                    setTime = 5
                    //startTimer()
                    //start timer
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("10m") {
                    setTime = 10
                   // startTimer()
                    //startTimer
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("25m") {
                    setTime = 25
                   // startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding()
            }
            HStack{
                Button("start"){
                    //setTime = (setTime < 120) ? setTime + setTime : 120
                    //startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(10)
    
                Spacer()
                Text(formattedtime).font(.system(size: 40)).fontDesign(.rounded)
                    .padding(10)
            }
        }
        var formattedtime : String {
            let minutes = Int(setTime)
            let seconds = Int((setTime - Double(minutes)) * 60)
            
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}

#Preview {
    ContentView()
}
