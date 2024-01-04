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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    Text("Slutte")
                        .font(.largeTitle)
                        .bold()
                        .fontWeight(.black)
                    Spacer()
                }
                
                backgroundView
                
                
            
                if counterViewModel.userHasQuitted {
                    quittedUserView
                } else {
                    newUserView
                }
            }
        }
        .onReceive(timer) { _ in
            self.counterViewModel.objectWillChange.send() // This will cause the view to redraw
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var quittedUserView: some View {
            ScrollView {
                
                    VStack(alignment: .center) {
                        CounterDisplay(counterViewModel: counterViewModel)
                            .padding(.vertical, 20)
                        
                        
                        
                        VStack {
                            Text("Money saved:")
                            Text("\(counterViewModel.moneySaved(), specifier: "%.2f") kr")
                                .font(.system(size: 50, weight: .bold, design: .default))
                                .bold()
                            
                            VStack {
                                HStack {
                                    Text("Your savings target")
                                        .bold()
                                    Spacer()
                                }
                                ProgressView(value: counterViewModel.moneySaved(), total: counterViewModel.savingsTarget)
                                    .tint(.green)
                                
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        Text("Change")
                                            .font(.body)
                                            .underline()
                                            .foregroundStyle(.black)
                                    }
                                    Spacer()
                                    
                                    Text("\(counterViewModel.savingsTarget, specifier: "%.0f") kr")
                                }
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                        }
                        .padding(.vertical, 20)
                    }
                    .padding(.vertical, 100)
            }
            .scrollDisabled(true)
            .padding(.vertical, 30)
        }


    private var backgroundView: some View {
        Color.orange.opacity(0.3).ignoresSafeArea()
    }


    private var newUserView: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
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
