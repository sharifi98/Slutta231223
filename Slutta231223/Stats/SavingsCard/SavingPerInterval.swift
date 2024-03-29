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
        
        ZStack {
            Color(red: 60 / 255, green: 80 / 255, blue: 20 / 255).opacity(0.3)
                .ignoresSafeArea()
            VStack {
                List {
                    
                    Section {
                        HStack{
                            VStack(alignment: .leading){
                                Text("\(counterViewModel.moneySaved(), specifier: "%.2f") kr")
                                    .bold()
                                    .font(.system(size: 36))
                                Text("Saved in total")
                            }
                            Spacer()
                        }
                    }
                    
                    Section("More numbers"){
                        HStack{
                            Text("Per Day")
                            Spacer()
                            Text("\(counterViewModel.snusCostPerDay(), specifier: "%.2f") kr")
                        }
                        .listRowSeparator(.hidden)
                        HStack{
                            Text("Per Week")
                            Spacer()
                            Text("\(counterViewModel.snusCostPerWeek(), specifier: "%.2f") kr")
                        }
                        .listRowSeparator(.hidden)
                        HStack{
                            Text("Per Month")
                            Spacer()
                            Text("\(counterViewModel.snusCostPerMonth(), specifier: "%.2f") kr")
                        }
                        .listRowSeparator(.hidden)
                        HStack{
                            Text("Per Year")
                            Spacer()
                            Text("\(counterViewModel.snusCostPerYear(), specifier: "%.2f") kr")
                        }
                        .listRowSeparator(.hidden)
                    }

                    
                }
                .scrollContentBackground(.hidden)
                
                
            
            }
        }
        
    }
}

#Preview {
        SavingPerInterval(counterViewModel: CounterViewModel())
    
}
