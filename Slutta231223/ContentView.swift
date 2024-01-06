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
        
        
    }


    @ViewBuilder
    private var quittingButton: some View {
        if selectedTab == 0 {
            NavigationLink(destination: SnusUsageInputView(counterViewModel: counterViewModel)) {
                Text("Start Quitting")
                    .styledButtonBackground(color: Color(red: 76 / 255, green: 175 / 255, blue: 80 / 255))
            }
        }
    }

    
    @ViewBuilder
    private var tipsAndTricksButton: some View {
        if selectedTab == 0 {
            Text("Tips & Tricks")
                .styledButtonBackground(color: Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255))
        }
    }
}

// Extension to provide styling for buttons.
extension View {
    func styledButtonBackground(color: Color) -> some View {
        self
            .foregroundStyle(.white)
            .frame(height: 30)
            .frame(width: 130)
            .bold()
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(20)
    }
}








#Preview {
    NavigationStack {
        ContentView(counterViewModel: CounterViewModel())
    }
}
