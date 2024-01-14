//
//  Achievements.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 24/12/2023.
//

import SwiftUI

struct Achievements: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var twentyMinutes: Double = 1200.0
    
    var body: some View {
        List {
            HStack {
                VStack(alignment: .leading){
                    Text("Puslen går ned")
                        .bold()
                    HStack{
                        Text("20 min")
                        ProgressView(value: twentyMinutes, total: 1200)
                            .onReceive(timer) { _ in
                                if twentyMinutes < 1200 {
                                    twentyMinutes += 1
                                }
                            }
                            .tint(.blue)
                    }
                }
                .padding()
                if twentyMinutes == 1200 {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 25))
                        .foregroundStyle(.green)
                }
            }
        }
    }
}

#Preview {
    Achievements()
}
