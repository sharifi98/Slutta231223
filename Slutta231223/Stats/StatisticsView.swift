//
//  StatisticsView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    @State private var twentyMinutes: Double = 0.0
    @State private var isShowingSaveInput: Bool = false
    @State private var isShowingSavingPerInterval = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ZStack {
                fixedBackground
                scrollableContent
            }
            .edgesIgnoringSafeArea(.all)
            .onReceive(timer) { _ in
                self.counterViewModel.objectWillChange.send()
        }
        }
    }

    private var fixedBackground: some View {
        GeometryReader { geometry in
                    VStack(spacing: 0) {
                        Color(red: 111 / 255.0, green: 110 / 255.0, blue: 85 / 255.0)
                            .frame(height: geometry.size.height * 0.7) // 70% height for blue
                        Color(red: 111 / 255.0, green: 110 / 255.0, blue: 85 / 255.0)
                            .frame(height: geometry.size.height * 0.4) // 40% height for white
                    }
        }
    }

    private var scrollableContent: some View {
        ScrollView {
            VStack {
                if counterViewModel.userHasQuitted {
                    quittedUserView
                } else {
                    newUserView
                        .padding(.top, 50)
                }
            }
            .padding(.top, 30)
        }
    }

    
    @ViewBuilder
    private var quittingButton: some View {
        
        NavigationLink(destination: SnusUsageInputView(counterViewModel: counterViewModel)) {
            
            if counterViewModel.userHasQuitted {
                Text("Edit")
                    .styledButtonBackground(color: .blue)
            } else {
                Text("Get started")
                    .styledButtonBackground(color: Color(red: 76 / 255, green: 175 / 255, blue: 80 / 255))
            }
        }
    }
    
    
    @ViewBuilder
    private var tipsAndTricksButton: some View {
        
        Text("Tips & Tricks")
            .styledButtonBackground(color: Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255))
    }
    
    private var quittedUserView: some View {
        ScrollView {
            
            HStack {
                //tipsAndTricksButton
                Spacer()
                quittingButton
            }
            .padding(.horizontal, 5)
            
            VStack(alignment: .center) {
                Text("You quit on \(counterViewModel.quitDate.formatted(.dateTime.day().month().year()))")
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                DaysSinceQuittingCounter(counterViewModel: counterViewModel)
                    .padding(.vertical, 20)
                
                
                VStack {
                    Text("Money saved:")
                        .foregroundStyle(.white)
                    Text("\(counterViewModel.moneySaved(), specifier: "%.2f") kr")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .bold()
                    
                    ZStack {
                        // Background card
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.yellow)
                            .shadow(radius: 10) // Adds a shadow for a subtle 3D effect
                            .frame(width: 375, height: 200)
                        
                        // Content of the card
                        VStack {
                            // Savings target label and value
                            HStack {
                                VStack(alignment: .leading) {
                                
                                        Text("Your savings target")
                                            .font(.headline)
                                            .padding(.bottom, 2)
                                    
                                    
                                    HStack{
                                        Text("\(counterViewModel.savingObject)")
                                            .font(.title2)
                                        Spacer()
                                        if counterViewModel.moneySaved() >= counterViewModel.savingsTarget {
                                            Image(systemName: "checkmark.circle")
                                                .font(.system(size: 22))
                                                .foregroundStyle(.green)
                                                .padding(.horizontal, -10)
                                        }
                                    }
                                }
                                Spacer()
                            }
                            
                            
                            
                            ProgressView(value: counterViewModel.moneySaved(), total: counterViewModel.savingsTarget)
                                .tint(.green)
                                .scaleEffect(x: 1, y: 3, anchor: .center)
                                .padding(.vertical)
                            
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(counterViewModel.moneySaved(), specifier: "%.2f") kr")
                                        .bold()
                                    Spacer()
                                    
                                    
                                    Spacer()
                                    Text("\(counterViewModel.savingsTarget, specifier: "%.0f") kr")
                                }
                                .padding(.horizontal, 2)
                                
                                // Change button
                                HStack(alignment: .center){
                                    Button("Change") {
                                        isShowingSaveInput.toggle()
                                    }
                                    .buttonStyle(.bordered)
                                    .padding(.top, 2)
                                    
                                    Spacer()
                                    
                                    Button("See more") {
                                        isShowingSavingPerInterval.toggle()
                                        
                                    }
                                    .foregroundStyle(.blue)
                                    
                                    Spacer()
                                    Spacer()
                                }
                                
                                
                            }
                            
                            
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        
                        Spacer()
                        
                        
                    }
                    .foregroundColor(.black)
                    
                    
                }
                .padding(.vertical, 20)
            }
            
            HealthCardListView(counterViewModel: counterViewModel)
                .padding(.bottom, 100)
        }
        .sheet(isPresented: $isShowingSavingPerInterval, content: {
            SavingPerInterval(counterViewModel: counterViewModel)
        })
        .sheet(isPresented: $isShowingSaveInput) {
            SavingsGoalSheet(counterViewModel: counterViewModel)
        }
        .padding(.vertical, 30)
    }
    
    private var backgroundView2: some View  {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(Color.purple)
            .frame(width: 400, height: 5000)
            .ignoresSafeArea(.all)
    }
    
    private var backgroundView: some View {
        GeometryReader { geometry in
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue,
                    Color.white
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
    
    
    
    
    private var newUserView: some View {
        ZStack {
            ScrollView{
                Spacer()
                VStack {
                    Text("Tap the button below to begin")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.white)
                    
                    quittingButton
                }
            }
        }
    }
}
                        
/*
 
 VStack {
     HealthCard(counterViewModel: counterViewModel, secondsUntilHealthGoalIsCompleted: 100, goalTime: "20 minutes", info: "When you use snus, the nicotine causes your pulse to increase and your blood vessels to constrict. It takes 20 minutes after you stop using nicotine for your pulse to go down.")
 }
 */

#Preview {
    NavigationStack {
        StatisticsView(counterViewModel: CounterViewModel())
    }
}
