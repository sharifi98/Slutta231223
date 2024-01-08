//
//  SnusInnhold.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 07/01/2024.
//

import SwiftUI

struct SnusInnhold: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image("snusbokser")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(20.0)
                    .padding([.top, .horizontal])

                HStack(alignment: .center){
                    Spacer()
                    Text("This is what you ingest when you use snus.")
                        .bold()
                        .font(.title)
                        .padding(.top)
                    Spacer()
                }
                    

                Text("Snus contains several harmful substances. Below, you can read about some of the most important of these substances.")
                    .padding(.vertical, 5.0)

                Divider()
                
                // Disclosure Groups
                Group {
                    DisclosureGroup("Nicotine") {
                        VStack(alignment: .leading) {
                            Text("• Nicotine is naturally found in the tobacco plant and therefore in all tobacco products, but can also be artificially made.")
                            Text("• The use of nicotine-containing products can lead to nicotine dependence. Nicotine has several harmful effects.")
                            Text("• The childhood and adolescent years are a vulnerable time for the development of nicotine dependence.")
                            Text("• The use of nicotine-containing products in childhood and adolescent years can also have an adverse effect on brain development, which is not fully developed until the mid-20s.")
                        }
                        .padding(.vertical, 10)
                    }
                    .padding(.bottom)
                    
                    DisclosureGroup("Carcinogenic Substances") {
                        VStack(alignment: .leading) {
                            Text("• Tobacco-specific nitrosamines (TSNAs) are formed from substances that occur naturally in the tobacco plant.")
                            Text("• Two commonly occurring tobacco-specific nitrosamines found in snus are abbreviated as NNK and NNN. These are carcinogenic.")
                        }
                        .padding(.vertical, 10)
                    }
                    .padding(.bottom)
                    
                    DisclosureGroup("Other Harmful Substances Found in Snus") {
                        VStack(alignment: .leading) {
                            Text("• Other harmful substances that can also be found in snus include heavy metals, arsenic compounds (arsenic), polycyclic aromatic hydrocarbons (PAHs), fungal toxins (mycotoxins), and residues of pesticides.")
                            Text("• The harmful health effects of these substances when using snus are uncertain.")
                        }
                        .padding(.vertical, 10)
                    }
                    .padding(.bottom)
                }

                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SnusInnhold()
}
