//
//  CounterViewModel.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published var quitDate: Date = Date()
    @Published var numberOfSnusPerDay: Int = 12
    @Published var pricePerPackageOfSnus: Int = 84
    @Published var piecesOfSnusPerPackage: Int = 24
    @Published var quitReason: String = "Health"
    @Published var userHasQuitted: Bool = true
    @Published var savingsTarget: Double = 10_000.0
    @Published var savingObject: String = ""
    
    
    
    init() {
        self.quitDate = Date.now - 86000
        self.numberOfSnusPerDay = 24
        self.pricePerPackageOfSnus = 89
        self.piecesOfSnusPerPackage = 24
        self.quitReason = "Health"
    }
    
    
    init(snusFreeSince: Date, numberOfSnusPerDay: Int, pricePerPackageOfSnus: Int, PiecesOfSnusPerPackage: Int, quitReason: String) {
        self.quitDate = snusFreeSince
        self.numberOfSnusPerDay = numberOfSnusPerDay
        self.pricePerPackageOfSnus = pricePerPackageOfSnus
        self.piecesOfSnusPerPackage = PiecesOfSnusPerPackage
        self.quitReason = quitReason
    }
    
    func snusPerMinute() -> Double {
        // 24 snus per day / 24 / 60
        return Double(numberOfSnusPerDay) / 24 / 60
    }
    func snusPerSecond() -> Double {
        return Double(numberOfSnusPerDay) / (24 * 60 * 60)
    }
    
    func moneySaved() -> Double {
        let costPerSnus = Double(pricePerPackageOfSnus) / Double(piecesOfSnusPerPackage)
        
        // Calculate the number of seconds since the user quit
        let secondsSinceQuit = Date.now.timeIntervalSince(quitDate)
        
        // Calculate the number of snus per second based on daily usage
        let snusPerSecond = Double(numberOfSnusPerDay) / (24 * 60 * 60)
        
        // Calculate the total number of snus not consumed
        let totalSnusNotConsumed = snusPerSecond * secondsSinceQuit
        
        // Calculate the total money saved
        let moneySaved = totalSnusNotConsumed * costPerSnus
        
        return moneySaved
    }
    
    func elapsedTimeAttributed() -> AttributedString {
        let now = Date.now
        let elapsedTime = now.timeIntervalSince(quitDate)

        let days = Int(elapsedTime / 86400)
        let hours = Int((elapsedTime / 3600).truncatingRemainder(dividingBy: 24))
        let minutes = Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))

        var attributedString = AttributedString("\(days) dager\n\(hours) timer\n\(minutes) minutt\n\(seconds) sekund")

        
        attributedString.foregroundColor = .blue // Change color
        attributedString.font = .system(size: 18, weight: .bold) // Change font size and weight

        // Specific styling for each unit
        if let range = attributedString.range(of: "\(days) days") {
            attributedString[range].foregroundColor = .blue
            attributedString[range].font = .system(size: 20, weight: .bold)
        }

        // Repeat for hours, minutes, seconds with different styles

        return attributedString
    }
    
}
