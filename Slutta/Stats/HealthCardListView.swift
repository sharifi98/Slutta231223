//
//  HealthCardListView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 11/01/2024.
//

import SwiftUI

struct HealthCardListView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    var body: some View {
        VStack {
            HealthCard(counterViewModel: counterViewModel, title: "Heart Rate Goes Down", secondsUntilHealthGoalIsCompleted: 1200, goalTime: "20 minutes", info: "When you use snus, the nicotine causes your pulse to increase and your blood vessels to constrict. After 20 minutes of not using nicotine your pulse goes down.")
            HealthCard(counterViewModel: counterViewModel, title: "Workday Without Snus", secondsUntilHealthGoalIsCompleted: 28800, goalTime: "8 hours", info: "For every snus you don't take, you save your body from a number of toxic chemicals.")
            HealthCard(counterViewModel: counterViewModel, title: "First Day", secondsUntilHealthGoalIsCompleted: 86400, goalTime: "24 hours", info: "Hooray! You've been snus-free for one day. Keep it up!")
            HealthCard(counterViewModel: counterViewModel, title: "Money Saved!", secondsUntilHealthGoalIsCompleted: 172800, goalTime: "48 hours", info: "2 days and you've already started to save money. A small tip: Set aside the money you would have spent on snus and see how quickly it adds up.")
            HealthCard(counterViewModel: counterViewModel, title: "Nicotine Free", secondsUntilHealthGoalIsCompleted: 259200, goalTime: "72 hours", info: "The nicotine is now out of your body. Congratulations!")
        }
    }
}

#Preview {
    HealthCardListView(counterViewModel: CounterViewModel())
}
