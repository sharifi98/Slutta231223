//
//  TipsView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 07/01/2024.
//

import SwiftUI

struct TipsListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Divider()

                    // Section 1
                    HStack {
                        Image("nature")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(10.0)
                            .frame(width: 100, height: 100)

                        VStack(alignment: .leading){
                            Text("These are the benefits of quitting snus.")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)

                            NavigationLink {
                                Fordeler()
                            } label: {
                                Text("Health gains")
                                    .underline()
                            }
                        }
                    }
                    .padding()

                    Divider()

                    // Section 2
                    HStack {
                        Image("ingest")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(10.0)
                            .frame(width: 100, height: 100)

                        VStack(alignment: .leading){
                            Text("This is what you ingest when you use snus.")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)

                            NavigationLink {
                                SnusInnhold()
                            } label: {
                                Text("See what snus contains")
                                    .underline()
                            }
                        }
                    }
                    .padding()

                    Divider()

                    // Section 3
                    HStack {
                        Image("medi")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(10.0)
                            .frame(width: 100, height: 100)

                        VStack(alignment: .leading){
                            Text("Managing cravings effectively")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                            

                            NavigationLink {
                                CravingTipsView()
                            } label: {
                                Text("Learn Techniques")
                                    .underline()
                                    
                            }
                        }
                    }
                    .padding()

                    Divider()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Tips and advice").font(.title).bold()
                    }
                }
            }
        }
    }
}



#Preview {
    NavigationStack {
        TipsListView()
    }
}
