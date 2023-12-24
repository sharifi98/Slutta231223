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
                        NavigationLink(destination: InputView(counterViewModel: counterViewModel)) {
                            Text("Slutt nå!")
                                .foregroundStyle(.black)
                                .underline()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if selectedTab == 0 {
                        Text("Fun facts")
                            .foregroundStyle(.black)
                            .underline()
                    }
                }
            }
        }
    }
}





#Preview {
    NavigationStack {
        ContentView(counterViewModel: CounterViewModel())
    }
}
