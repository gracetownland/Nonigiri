//
//  TimerHelper.swift
//  nonigiri
//
//  Created by Ayush S on 2024-06-23.
//

import Foundation

class TimerHelper : NSObject {
    var timer:Timer = Timer()
    var setTime: Double = 0.0
    @Published var isTimerRunning = false
    var timerCount = 0
    
    init(setTime: Double){
        self.setTime = setTime
    }

    @objc func timerCounter(){
        timerCount += 1
                   if (timerCount == 10){
                       setTime = setTime - 0.01
                       timerCount = 0
       
                       if(setTime <= 0.0)
                       {
                           timer.invalidate()
                       }
                   }
    }
    
    func startTimer(){
        isTimerRunning = true
        
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        
    }
}
