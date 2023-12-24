//
//  InputView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import SwiftUI

struct InputView: View {
    
    @ObservedObject var counterViewModel: CounterViewModel
    @Environment(\.dismiss) var dismiss
    
    
    
    var snusNumberRange = 1...50
    var priceRange = 20...120
    var quitReason: [String] = ["Health", "Money", "Addiction", "My nearest"]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Color.orange.opacity(0.15).ignoresSafeArea()
                
                VStack {
                    Image(systemName: "circle")
                        .font(.system(size: 100))
                    Divider()
                        .frame(height: 1)
                        .overlay(.blue)
                    
                    List {
                        HStack {
                            VStack(alignment: .leading){
                                Text("Number of Snus")
                                    .bold()
                                Text("Number of snus you used daily before you decided to quit.")
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            Menu {
                                Picker("", selection: $counterViewModel.numberOfSnusPerDay) {
                                    ForEach(snusNumberRange, id: \.self) {
                                        Text("\($0)")
                                        
                                        
                                    }
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.blue)
                                        .clipShape(Rectangle())
                                        .cornerRadius(5)
                                        .frame(width: 30, height: 30)
                                    Text("\(counterViewModel.numberOfSnusPerDay)")
                                        .foregroundStyle(.white)
                                        .underline()
                                }
                                    

                                
                            }
                            
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color.orange.opacity(0.15))
                        
                        HStack {
                            Text("Price Per Package")
                                .bold()
                            Spacer()
                            
                            Menu {
                                Picker("", selection: $counterViewModel.pricePerPackageOfSnus) {
                                    ForEach(priceRange, id: \.self) {
                                        Text("\($0)")
                                    }
                                    
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.blue)
                                        .clipShape(Rectangle())
                                        .cornerRadius(5)
                                        .frame(width: 30, height: 30)
                                    Text("\(counterViewModel.pricePerPackageOfSnus)")
                                        .foregroundStyle(.white)
                                        .underline()
                                }
                                    

                                
                            }
                        }
                        .listRowSeparatorTint(Color.blue)
                        .listRowBackground(Color.orange.opacity(0.15))
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Pieces Per Package")
                                    .bold()
                                Text("Number of pieces in the package you used to buy.")
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            Menu {
                                Picker("", selection: $counterViewModel.piecesOfSnusPerPackage) {
                                    ForEach(snusNumberRange, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.blue)
                                        .clipShape(Rectangle())
                                        .cornerRadius(5)
                                        .frame(width: 30, height: 30)
                                    Text("\(counterViewModel.piecesOfSnusPerPackage)")
                                        .foregroundStyle(.white)
                                        .underline()
                                }
                                    

                                
                            }
                        }
                        .padding(.vertical, 5)
                        .listRowSeparatorTint(Color.blue)
                        .listRowBackground(Color.orange.opacity(0.15))
                        
                        
                        HStack {
                            DatePicker("Snus-free since", selection: $counterViewModel.quitDate)
                                .bold()
                                .colorMultiply(.blue)
                                
                        }
                        .padding(.vertical, 5)
                        .listRowSeparatorTint(Color.blue)
                        .listRowBackground(Color.orange.opacity(0.15))
                        
                        VStack {
                            Text("I Quit Because")
                            Picker("", selection: $counterViewModel.quitReason) {
                                ForEach(quitReason, id: \.self) {
                                    Text($0)
                                }
                                
                            }
                            .pickerStyle(.segmented)
                            .colorMultiply(.blue)
                        }
                        .listRowSeparatorTint(.clear)
                        .listRowBackground(Color.orange.opacity(0.15))
                        /*
                         Divider()
                         .frame(width: .infinity, height: 1.0)
                         .overlay(.blue)
                         .padding(.horizontal, -20)
                         .listRowSeparatorTint(.clear)
                         
                         */
                        
                        VStack {
                            Spacer()
                            Text("")
                        }
                        .padding(.bottom, 200)
                        .listRowBackground(Color.orange.opacity(0.15))
                        
                        
                    }
                    .listStyle(.inset)
                    .scrollDisabled(true)
                    
                    
                    
                    Button("Save") {
                        dismiss()
                    }
                    .frame(width: 100)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.horizontal)
                }
            }
        }
        
        
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        let mockCounterViewModel = CounterViewModel(
            snusFreeSince: Date(),
            numberOfSnusPerDay: 20,
            pricePerPackageOfSnus: 84,
            PiecesOfSnusPerPackage: 24,
            quitReason: "Health"
        )
        
        InputView(counterViewModel: mockCounterViewModel)
            .preferredColorScheme(.light) // Show only in light mode
    }
}


