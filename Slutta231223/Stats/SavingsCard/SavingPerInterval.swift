//
//  SavingPerInterval.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 06/01/2024.
//

import SwiftUI

struct SavingPerInterval: View {
    @ObservedObject var counterViewModel: CounterViewModel
    var body: some View {
        VStack {
            Text("\(counterViewModel.moneySaved())")
        }
    }
}

#Preview {
    SavingPerInterval(counterViewModel: CounterViewModel())
}
