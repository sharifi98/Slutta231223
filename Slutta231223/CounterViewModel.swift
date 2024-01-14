//
//  CounterViewModel.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published var quitDate: Date
    @Published var numberOfSnusPerDay: Int
    @Published var pricePerPackageOfSnus: Int
    @Published var piecesOfSnusPerPackage: Int
    @Published var quitReason: String
    @Published var userHasQuitted: Bool
    @Published var savingsTarget: Double
    @Published var savingObject: String
    
    init() {
        // Load initial or saved values
        quitDate = UserDefaults.standard.object(forKey: "quitDate") as? Date ?? Date.now
        numberOfSnusPerDay = UserDefaults.standard.integer(forKey: "numberOfSnusPerDay") != 0 ? UserDefaults.standard.integer(forKey: "numberOfSnusPerDay") : 20
        pricePerPackageOfSnus = UserDefaults.standard.integer(forKey: "pricePerPackageOfSnus") != 0 ? UserDefaults.standard.integer(forKey: "pricePerPackageOfSnus") : 84
        piecesOfSnusPerPackage = UserDefaults.standard.integer(forKey: "piecesOfSnusPerPackage") != 0 ? UserDefaults.standard.integer(forKey: "piecesOfSnusPerPackage") : 24
        quitReason = UserDefaults.standard.string(forKey: "quitReason") ?? "Health"
        userHasQuitted = UserDefaults.standard.bool(forKey: "userHasQuitted")
        savingsTarget = UserDefaults.standard.double(forKey: "savingsTarget") != 0 ? UserDefaults.standard.double(forKey: "savingsTarget") : 10_000.0
        savingObject = UserDefaults.standard.string(forKey: "savingObject") ?? "iPhone 16"
    }

    init(snusFreeSince: Date, numberOfSnusPerDay: Int, pricePerPackageOfSnus: Int, piecesOfSnusPerPackage: Int, quitReason: String) {
        self.quitDate = snusFreeSince
        self.numberOfSnusPerDay = numberOfSnusPerDay
        self.pricePerPackageOfSnus = pricePerPackageOfSnus
        self.piecesOfSnusPerPackage = piecesOfSnusPerPackage
        self.quitReason = quitReason
        self.userHasQuitted = false
        self.savingsTarget = 10_000.0
        self.savingObject = "Bitcoin"
    }
    
    func saveAllData() {
        UserDefaults.standard.set(quitDate, forKey: "quitDate")
        UserDefaults.standard.set(numberOfSnusPerDay, forKey: "numberOfSnusPerDay")
        UserDefaults.standard.set(pricePerPackageOfSnus, forKey: "pricePerPackageOfSnus")
        UserDefaults.standard.set(piecesOfSnusPerPackage, forKey: "piecesOfSnusPerPackage")
        UserDefaults.standard.set(quitReason, forKey: "quitReason")
        UserDefaults.standard.set(userHasQuitted, forKey: "userHasQuitted")
        UserDefaults.standard.set(savingsTarget, forKey: "savingsTarget")
        UserDefaults.standard.set(savingObject, forKey: "savingObject")
        print(userHasQuitted)
    }
    
    func saveDataOfSavings() {
        UserDefaults.standard.set(savingObject, forKey: "savingObject")
        UserDefaults.standard.set(savingsTarget, forKey: "savingsTarget")
    }
    
    func snusPerMinute() -> Double {
        Double(numberOfSnusPerDay) / (24 * 60)
    }
    
    func snusPerSecond() -> Double {
        Double(numberOfSnusPerDay) / (24 * 60 * 60)
    }
    func snusCostPerDay() -> Double {
        return (Double(pricePerPackageOfSnus) / Double(piecesOfSnusPerPackage)) * Double(numberOfSnusPerDay)
    }
    
    func snusCostPerWeek() -> Double {
        return snusCostPerDay() * 7
    }
    func snusCostPerMonth() -> Double {
        return snusCostPerDay() * 30.5
    }
    
    func snusCostPerYear() -> Double {
        return snusCostPerDay() * 365
    }
    
    func moneySaved() -> Double {
        let costPerSnus = Double(pricePerPackageOfSnus) / Double(piecesOfSnusPerPackage)
        let secondsSinceQuit = Date.now.timeIntervalSince(quitDate)
        let totalSnusNotConsumed = snusPerSecond() * secondsSinceQuit
        return totalSnusNotConsumed * costPerSnus
    }
    
    func secondsSinceQuitting() -> Double {
        let now = Date.now
        let secondsSinceQuit = now.timeIntervalSince(quitDate)
        return secondsSinceQuit
    }

    
    func elapsedTimeAttributed() -> AttributedString {
        let elapsedTime = Date.now.timeIntervalSince(quitDate)
        let days = Int(elapsedTime / 86400)
        let hours = Int((elapsedTime / 3600).truncatingRemainder(dividingBy: 24))
        let minutes = Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))

        var attributedString = AttributedString("\(days) dager\n\(hours) timer\n\(minutes) minutt\n\(seconds) sekund")
        attributedString.foregroundColor = .blue
        attributedString.font = .system(size: 18, weight: .bold)

        return attributedString
    }

}
