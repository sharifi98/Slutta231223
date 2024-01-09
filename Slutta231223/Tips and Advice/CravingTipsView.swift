//
//  CravingsTips.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 08/01/2024.
//
import SwiftUI

struct CravingTipsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Tips to Manage Snus Cravings")
                    .bold()
                    .font(.title)
                    .padding(.bottom, 10)

                // Tip 1: Meditation
                VStack(alignment: .leading) {
                    Image("meditation")
                        .resizable()
                        .scaledToFit()
                    Text("Meditation")
                        .font(.headline)
                    Text("Regular meditation can help calm your mind and reduce the urge to use snus.")
                        .padding(.bottom, 5)
                }

                // Tip 2: Drinking Water
                VStack(alignment: .leading) {
                    Image("water")
                        .resizable()
                        .scaledToFit()
                    Text("Drink Lots of Water")
                        .font(.headline)
                    Text("Staying hydrated can reduce cravings and help with oral fixation.")
                        .padding(.bottom, 5)
                    
                }

                // Tip 3: Pickled Ginger
                VStack(alignment: .leading) {
                    
                    Image("apple")
                        .resizable()
                        .scaledToFit()
                    Text("Use Pickled Ginger")
                        .font(.headline)
                    Text("Placing pickled ginger under your lip can provide a sensation similar to snus and help manage cravings.")
                        .padding(.bottom, 5)
                    
                }

                // Tip 4: Pastilles
                VStack(alignment: .leading) {
                    Image("drops")
                        .resizable()
                        .scaledToFit()
                    Text("Pastilles")
                        .font(.headline)
                    Text("Sucking on pastilles can keep your mouth busy and distract from the craving.")
                        .padding(.bottom, 5)
                    Image("pastilles")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}



#Preview {
    CravingTipsView()
}
