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
                goalInputSection
                saveButton
            }
            .navigationTitle("Savings Goal")
            .toolbar {
                cancelButton
            }
        }
    }

    // MARK: - Subviews

    private var goalInputSection: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("What do you want to save for?", text: $counterViewModel.savingObject)
                    .textFieldStyle()

                HStack {
                    TextField("kr", value: $counterViewModel.savingsTarget, format: .number)
                    Text("kr")
                }
                .textFieldStyle()
            }
            .padding()
        }
    }

    private var saveButton: some View {
        Button("Save") {
            counterViewModel.saveDataOfSavings()
            dismiss()
        }
        .buttonStyle()
        .padding(.top, 20)
    }

    private var cancelButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("Cancel") {
                dismiss()
            }
        }
    }
}

// MARK: - Custom Styles

extension View {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .foregroundColor(.black)
            .bold()
    }

    func buttonStyle() -> some View {
        self
            .padding()
            .frame(height: 40)
            .frame(maxWidth: 150)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(20)
            .bold()
    }
}


#Preview {
    NavigationStack {
        SavingsGoalSheet(counterViewModel: CounterViewModel())
    }
}
