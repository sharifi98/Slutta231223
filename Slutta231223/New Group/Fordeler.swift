//
//  Fordeler.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 08/01/2024.
//

import SwiftUI

struct Fordeler: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image("sluttesnus")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(20.0)
                    .padding([.top, .horizontal])
                
                Text("These are the benefits of quitting snus.")
                    .bold()
                    .font(.title)
                    .padding(.top)
                
                Text("There are many health benefits to quitting snus. Here you can read about what happens to the body")
                    .padding(.vertical, 5.0)
                
                Divider()
                
                Group {
                    DisclosureGroup("Dependence") {
                        VStack(alignment: .leading) {
                            Text("When you are free from snus, you have rid yourself of a highly addictive product.")
                            Text("")
                            Text("Fact: The nicotine in snus is absorbed into the blood through the mucous membranes in the mouth. Shortly after the snus is in the mouth, the nicotine reaches the brain. Here, substances in the reward system are released. This provides a calming, yet stimulating effect.")
                            Text("Lack of nicotine supply will quickly lead to withdrawal symptoms. It is the combination of these effects that creates addiction.")
                        }
                    }
                    Divider()
                    
                    DisclosureGroup("Teeth") {
                        VStack(alignment: .leading) {
                            Text("When you don't use snus, you don't have to worry about discoloration of your teeth due to snus.")
                            Text("")
                            Text("Fact: On the teeth, there are microscopic cracks and irregularities where the snus settles. Additionally, the gums in the area where the snus is placed can recede, leading to long tooth necks. This increases the risk of sensitivity and cavities. In the worst case, it can lead to your teeth loosening.")
                        }
                    }
                    Divider()
                    
                    DisclosureGroup("Mouth") {
                        Text("When you don't use snus, you avoid irritating the mucous membranes in your mouth.")
                        Text("")
                        Text("Fact: Snus can lead to changes in the oral mucosa where the snus is placed. Some changes may reverse, others may not. With prolonged use, a depression known as a 'snus pocket' can develop.")
                    }
                    Divider()
                    
                    DisclosureGroup("Health") {
                        Text("When you don't use snus, you avoid worrying about the negative impact of snus on your health.")
                        Text("Fact: The EU and WHO have classified snus as carcinogenic. The pancreas and esophagus are most at risk. Snus also increases the risk of death from heart attacks.")
                    }
                    Divider()
                    
                    DisclosureGroup("Physical Exercise") {
                        Text("When you don't use snus, you avoid increased pulse and blood pressure due to snus.")
                        Text("")
                        Text("Fact: When blood pressure rises, the heart must work harder. A Norwegian study shows that snus increases the risk of damage to muscles and the skeleton. It is also possible that injuries to tissues and muscles heal more slowly when you use snus.")
                    }
                    Divider()
                    
                    DisclosureGroup("Overweight") {
                        Text("When you don't use snus, you avoid worrying about changes in metabolism.")
                        Text("")
                        Text("Fact: There is a possible link between snus use and the development of type 2 diabetes and overweight due to changes in metabolism.")
                    }
                    Divider()
                    
                    DisclosureGroup("Pregnancy") {
                        Text("Using snus during pregnancy has many of the same effects on the fetus as smoking.")
                        Text("")
                        Text("Fact: Snus contains nicotine, which causes blood vessels to constrict. This leads to poorer blood flow to the fetus through the placenta. Using snus increases the risk of stillbirth and premature birth. Snus use also results in lower birth weight in the child and increases the risk of apnea and cleft lip and palate malformations. ")
                    }
                    
                }
                Divider()
                    .padding(.bottom, 150)
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    Fordeler()
}
