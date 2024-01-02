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
    // Changed to true to test things, change back to false
    @State private var userHasQuitted: Bool = true
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
            
                if userHasQuitted {
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
                GlassmorphicCardView {
                    VStack(alignment: .center) {
                        CounterView(counterViewModel: counterViewModel)
                        
                        VStack {
                            Text("Penger spart:")
                            Text("\(counterViewModel.moneySaved(), specifier: "%.2f") kr")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .bold()
                        }
                    }
                }
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
                Text("Trykk på Slutt Nå knappen øverst til høyre")
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
