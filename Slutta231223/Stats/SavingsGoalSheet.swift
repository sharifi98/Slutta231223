//
//  SavingsGoalSheet.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 05/01/2024.
//

import SwiftUI

struct SavingsGoalSheet: View {
    @ObservedObject var counterViewModel: CounterViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                // Scrollable content
                ScrollView {
                    VStack {
                        // Placeholder VStack for potential future content
                    }
                    .padding(.bottom, 50)

                    // Section for entering the saving object and target
                    VStack {
                        VStack(alignment: .leading) {
                            Text("What do you want to save for?")
                            
                            TextField("Input", text: $counterViewModel.savingObject)
                                .foregroundStyle(Color(red: 102 / 255, green: 187 / 255, blue: 106 / 255))
                        }
                        .bold()
                        .padding(.horizontal, 10)
                        
                        Divider()
                            .frame(width: 375)

                        VStack(alignment: .leading) {
                            Text("How much do you need?")
                            HStack {
                                TextField("kr", value: $counterViewModel.savingsTarget, format: .number)
                                Text("kr")
                                    .padding(.leading, -8) // Adjust this padding to align the label as needed
                                Spacer()
                            }
                            .foregroundStyle(Color(red: 102 / 255, green: 187 / 255, blue: 106 / 255))
                        }
                        .bold()
                        .padding(.horizontal, 10)
                        
                        Divider()
                            .frame(width: 375)
                    }
                }
                .scrollDisabled(true)
                .toolbar {
                    // Toolbar item for cancel button
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundStyle(.black)
                                .underline()
                        }
                    }
                }

                // Button at the bottom right
                HStack {
                    Spacer()
                    Button {
                        counterViewModel.saveDataOfSavings()
                        dismiss()
                    } label: {
                        Text("Save")
                            .padding()
                            .frame(height: 40)
                            .frame(width: 100)
                            .bold()
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(50)
                            
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SavingsGoalSheet(counterViewModel: CounterViewModel())
    }
}
