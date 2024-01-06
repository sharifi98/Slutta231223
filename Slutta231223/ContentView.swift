//
//  ContentView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    @State private var selectedTab: Int = 0
    
    
    var body: some View {
        NavigationStack {
            
            TabView(selection: $selectedTab) {
                
                StatisticsView(counterViewModel: counterViewModel)
                    .tabItem {
                        Label("Statistikk", systemImage: "chart.bar.xaxis")
                    }
                    .tag(0)
                
                Text("Hello")
                    .tabItem {
                        Label("Test", systemImage: "circle")
                    }
                    .tag(1)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if selectedTab == 0 {
                        NavigationLink(destination: SnusUsageInputView(counterViewModel: counterViewModel)) {
                            
                            Text("Start Quitting")
                                .foregroundStyle(.white)
                                .frame(height: 30)
                                .frame(width: 130)
                                .bold()
                                .background(Color(red: 76 / 255, green: 175 / 255, blue: 80 / 255))
                                .cornerRadius(20)
                                .padding(.horizontal, -7)
                            //userHasQuitted = true
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if selectedTab == 0 {
                        HStack{
                            Text("Tips & Tricks")
                                .foregroundStyle(.white)
                                .frame(height: 30)
                                .frame(width: 130)
                                .bold()
                                .foregroundColor(.white)
                                .background(Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255))
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
        .tint(.red.opacity(0.8))
        
    }
}





#Preview {
    NavigationStack {
        ContentView(counterViewModel: CounterViewModel())
    }
}
