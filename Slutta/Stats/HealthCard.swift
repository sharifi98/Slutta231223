//
//  MotivationalCard.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 06/01/2024.
//

import SwiftUI


struct HealthCard: View {
    @ObservedObject var counterViewModel: CounterViewModel
    var title: String
    var secondsUntilHealthGoalIsCompleted: Int
    var goalTime: String
    var info: String
    @State private var dynamicHeight: CGFloat = 100 // Default height

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.white)
                .shadow(radius: 10)
                .frame(width: 375, height: dynamicHeight)

            VStack(alignment: .leading) {
                VStack {
                    Text(title)
                        .font(.system(size: 22))
                        .padding(.top, -35)
                    
                    HStack {
                        Spacer()
                        Text(goalTime)
                            .font(.subheadline)
                        Spacer()
                    }
                }
                
                HStack {
                    Text("\(goalCompletionPercentage(), specifier: "%.0f")")
                        .bold()
                        .padding(.leading)
                    
                    // ProgressView logic
                    ProgressView(value: counterViewModel.secondsSinceQuitting(), total: Double(secondsUntilHealthGoalIsCompleted))
                        .tint(progressViewColor())
                        .scaleEffect(x: 1, y: 3, anchor: .center)
                        .padding(3)

                    Text("100")
                        .bold()
                        .padding(.trailing)
                }

                Text(info)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .padding(.bottom, -30)
                    .padding(.top, 5)
                    .background(GeometryReader { textGeometry in
                        Color.clear.onAppear {
                            // Update the dynamic height based on the text size
                            dynamicHeight = textGeometry.size.height + 150 // Adjust as needed
                        }
                    })
            }
        }
        .frame(width: 375) // Width of the card
    }
    
    private func goalCompletionPercentage() -> Double {
        let secondsSinceQuitting = counterViewModel.secondsSinceQuitting()
        let goalTotal = Double(secondsUntilHealthGoalIsCompleted)
        let percentage = (secondsSinceQuitting / goalTotal) * 100
        return min(percentage, 100) // Caps the percentage at 100
    }

    private func progressViewColor() -> Color {
        let percentage = goalCompletionPercentage()
        switch percentage {
        case 0..<30:
            return .red
        case 30..<50:
            return .orange
        default:
            return .green
        }
    }
}




#Preview {
    HealthCard(counterViewModel: CounterViewModel(snusFreeSince: Date.now - 40, numberOfSnusPerDay: 24, pricePerPackageOfSnus: 84, piecesOfSnusPerPackage: 24, quitReason: "Health"), title: "Heart rate goes down ", secondsUntilHealthGoalIsCompleted: 100, goalTime: "20 minutes", info: "When you use snus, the nicotine causes your pulse to increase and your blood vessels to constrict. It takes 20 minutes after you stop using nicotine for your pulse to go down.")
}
