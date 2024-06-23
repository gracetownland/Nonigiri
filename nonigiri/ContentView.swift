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
    @State private var timer: Timer?
    @State private var isTimerRunning = false
    @State private var isEditing = false
    @State private var timerCount: TimeInterval = 0
    let mainScreen = NSScreen.main
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if (timerCount > 0) {
                timerCount -= 1
            }
            else {
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
    }
    
    
    var body: some View {

        VStack{
            
            ModernSlider(
                "Time",
                systemImage: "deskclock",
                sliderWidth: 300,
                sliderHeight: 30,
                sliderColor: .white,
                value: Binding(
                    get: {timerCount/72},
                    set: {timerCount = $0 * 72}
                    )
                )
            .padding(.top)
            

            HStack{
                Button("5m") {
                    timerCount = 5
                    startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("10m") {
                    timerCount = 10
                    startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                Button("25m") {
                    timerCount = 25
                    startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(5)
                
                
                Spacer()
                Image(systemName: "ellipsis")
                    .padding()
            }
            HStack{
                Button("start"){
                    startTimer()
                }
                .buttonStyle(.accessoryBar)
                .padding(10)
    
                Spacer()
                Text(formattedtime).font(.system(size: 40)).fontDesign(.rounded)
                    .padding(10)
            }
        }
        var formattedtime : String {
            let hours = Int(timerCount) / 3600
            let minutes = (Int(timerCount) % 3600) / 60
            let seconds = Int(timerCount) % 60
            
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
}

#Preview {
    ContentView()
}
