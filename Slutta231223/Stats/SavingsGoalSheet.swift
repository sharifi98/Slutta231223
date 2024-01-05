//
//  SavingsGoalSheet.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 05/01/2024.
//

import SwiftUI

struct SavingsGoalSheet: View {
    @ObservedObject var counterViewModel: CounterViewModel
    
    
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading) {
                Text("What do you want to save for?")
                //TextField("\(counterViewModel.savingObject)")
                TextField("Input", text: $counterViewModel.savingObject)
                
            }
            .padding(.horizontal, 10)
            
            Divider()
                .frame(width: 375)
            
            VStack(alignment: .leading) {
                Text("How much do you need?")
                TextField("kr", value: $counterViewModel.savingsTarget, format: .number)
            }
            .padding(.horizontal, 10)
            
            Divider()
                .frame(width: 375)
        }
    }
}

#Preview {
    SavingsGoalSheet(counterViewModel: CounterViewModel())
}
