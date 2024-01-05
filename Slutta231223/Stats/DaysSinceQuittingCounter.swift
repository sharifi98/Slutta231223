//
//  CounterView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 24/12/2023.
//

import SwiftUI

struct DaysSinceQuittingCounter: View {
    @ObservedObject var counterViewModel: CounterViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Group {
                VStack{
                    
                    Text(counterViewModel.elapsedTimeComponents().days)
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                    
                    
                    Text("Days")
                        .font(.caption2)
                }
            }
            
            
            Group {
                VStack{
                    HStack{
                        Text(counterViewModel.elapsedTimeComponents().hours)
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                    }
                    Text("Hours")
                        .font(.caption2)
                }
            }
            
            
            Group {
                VStack{
                    
                    Text(counterViewModel.elapsedTimeComponents().minutes)
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                    
                    
                    Text("Minutes")
                        .font(.caption2)
                }
            }
            
            Group {
                VStack {
                    
                    Text(counterViewModel.elapsedTimeComponents().seconds)
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                    
                    
                    Text("Seconds")
                        .font(.caption2)
                }
            }
        }
        .foregroundStyle(.black)
        .onReceive(timer) { _ in
            // This will cause the view to update every second
            self.counterViewModel.objectWillChange.send()
        }
        .frame(maxWidth: 380, maxHeight: 150)
        .background(Color("TimerBackground")) // Define this color in your asset catalog
        .foregroundColor(Color("TimerText")) // Define this color in your asset catalog
    }
}

extension CounterViewModel {
    func elapsedTimeComponents() -> (days: String, hours: String, minutes: String, seconds: String) {
        let now = Date.now
        let elapsedTime = now.timeIntervalSince(quitDate)
        
        let days = String(format: "%02d", Int(elapsedTime / 86400))
        let hours = String(format: "%02d", Int((elapsedTime / 3600).truncatingRemainder(dividingBy: 24)))
        let minutes = String(format: "%02d", Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60)))
        let seconds = String(format: "%02d", Int(elapsedTime.truncatingRemainder(dividingBy: 60)))
        
        return (days, hours, minutes, seconds)
    }
}


#Preview {
    DaysSinceQuittingCounter(counterViewModel: CounterViewModel())
}
