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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        
            ZStack {
                
                //backgroundView
                
                VStack {
                    
                    if counterViewModel.userHasQuitted {
                        quittedUserView
                    } else {
                        newUserView
                    }
                }
                
                
                
            }
            .background(VStack(spacing: .zero) { Color.blue; Color.white }).ignoresSafeArea(.all)
        
        .onReceive(timer) { _ in
            self.counterViewModel.objectWillChange.send() // This will cause the view to redraw
        }
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private var quittingButton: some View {
        
            NavigationLink(destination: SnusUsageInputView(counterViewModel: counterViewModel)) {
                Text("Start Quitting")
                    .styledButtonBackground(color: Color(red: 76 / 255, green: 175 / 255, blue: 80 / 255))
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
                tipsAndTricksButton
                Spacer()
                quittingButton
            }
            .padding(.horizontal, 5)
            
            VStack(alignment: .center) {
                Text("You quit on \(counterViewModel.quitDate.formatted(.dateTime.day().month().year()))")
                    .foregroundStyle(.white)
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
                            .fill(Color.white)
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
                                    
                                    Text("\(counterViewModel.savingObject)")
                                        .font(.title2)
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
                                        .foregroundColor(.gray)
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
                                        
                                    }
                                    .foregroundStyle(.blue)
                                    
                                    Spacer()
                                    Spacer()
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                    }
                    .foregroundColor(.black)

                }
                .padding(.vertical, 20)
            }
            .padding(.vertical, 100)
        }
        .sheet(isPresented: $isShowingSaveInput) {
            SavingsGoalSheet(counterViewModel: counterViewModel)
        }
        .padding(.vertical, 30)
    }
    
    
    private var backgroundView: some View {
        GeometryReader { geometry in
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue, // Start with the purple color you want
                    Color.white // Finally, complete white
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
            Color(red: 224 / 255, green: 242 / 255, blue: 241 / 255)
            VStack {
                Text("Trykk på Slutt nå knappen øverst til høyre")
            }
        }
    }
}

struct GlassmorphicCardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white.opacity(0.4))
                .background(
                    VisualEffectBlur(blurStyle: .systemThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                )
                .frame(width: 350, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
            content
        }
        .padding()
    }
}

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    NavigationStack {
        StatisticsView(counterViewModel: CounterViewModel())
    }
}
