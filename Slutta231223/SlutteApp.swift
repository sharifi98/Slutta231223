//
//  Slutta231223App.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import SwiftUI

@main
struct SlutteApp: App {
    // Shared instance of CounterViewModel
    
    
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor.white
        // Apply appearance to different states
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    @StateObject var counterViewModel = CounterViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(counterViewModel: counterViewModel)
        }
    }
}

