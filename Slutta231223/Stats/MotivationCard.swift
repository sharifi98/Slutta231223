//
//  MotivationalCard.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 06/01/2024.
//

import SwiftUI

struct MotivationCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.white)
                .shadow(radius: 10) // 3D effect
                .frame(width: 375, height: 200)
            
            VStack(alignment: .leading) {
                Text("This is what you ingest when you use snus.")
                    .bold()
                    .padding([.top, .leading, .trailing])
                NavigationLink(destination: Text("Nicotine Details")) {
                    Text("Nicotine")
                    
                }
                .padding([.leading, .bottom, .trailing])
                Spacer()
            }
        }
        .frame(width: 375, height: 200) // Match the frame size with RoundedRectangle
    }
}

#Preview {
    MotivationCard()
}
