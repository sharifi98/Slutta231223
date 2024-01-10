//
//  MotivationalCard.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 06/01/2024.
//

import SwiftUI


struct HealthCard: View {
    @ObservedObject var counterViewModel: CounterViewModel
    var secondsUntilHealthGoalIsCompleted: Int
    @State private var dynamicHeight: CGFloat = 100 // Default height

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.white)
                .shadow(radius: 10)
                .frame(width: 375, height: dynamicHeight)

            VStack(alignment: .leading) {
                HStack{
                    Text("1")
                        .padding(.leading)
                    ProgressView(value: counterViewModel.secondsSinceQuitting(), total: Double(secondsUntilHealthGoalIsCompleted))
                        .tint(.green)
                        .scaleEffect(x: 1, y: 3, anchor: .center)
                        .padding(3)
                    Text("100")
                        .padding(.trailing)
                }

                Text("Your ")
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .padding(.vertical, -10)
                    .background(GeometryReader { textGeometry in
                        Color.clear.onAppear {
                            // Update the dynamic height based on the text size
                            dynamicHeight = textGeometry.size.height + 100 // Adjust as needed
                        }
                    })
            }
        }
        .frame(width: 375) // Width of the card
    }
}




#Preview {
    HealthCard(counterViewModel: CounterViewModel(snusFreeSince: Date.now - 86000, numberOfSnusPerDay: 24, pricePerPackageOfSnus: 84, piecesOfSnusPerPackage: 24, quitReason: "Health"), secondsUntilHealthGoalIsCompleted: 800)
}
