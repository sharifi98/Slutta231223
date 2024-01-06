//
//  TipsView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 07/01/2024.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.white)
                        .shadow(radius: 10) // 3D effect
                        .frame(width: 375, height: 100)
                    VStack(alignment: .leading) {
                        
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Image("snusbokser")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .clipShape(Rectangle())
                                    .cornerRadius(10.0)
                                    .frame(width: 100, height: 100)
                                Text("This is what you ingest when you use snus.")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .frame(width: 250, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Tips and advice").font(.title)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TipsView()
    }
}
