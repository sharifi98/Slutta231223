//
//  InputView.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 23/12/2023.
//

import SwiftUI

struct SnusUsageInputView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    @Environment(\.dismiss) var dismiss
    
    //@Binding var userHasQuitted: Bool

    var snusNumberRange = 1...50
    var priceRange = 20...120
    var quitReason: [String] = ["Health", "Money", "Addiction", "My nearest"]
    
    

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.1).ignoresSafeArea()
                
                VStack {
                    Image(systemName: "circle")
                        .font(.system(size: 100))
                    Divider()
                        .frame(height: 1)
                        .overlay(.black)
                    
                    List {
                        
                        // Number of Snus Picker
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Number of Snus")
                                    .bold()
                                Text("Number of snus you used daily before you decided to quit.")
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            Picker("", selection: $counterViewModel.numberOfSnusPerDay) {
                                ForEach(snusNumberRange, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 120)
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())

                        // Price Per Package Picker
                        HStack {
                            Text("Price Per Package")
                                .bold()
                            Spacer()
                            
                            Picker("", selection: $counterViewModel.pricePerPackageOfSnus) {
                                ForEach(priceRange, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 120)
                        }
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())

                        // Pieces Per Package Picker
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Pieces Per Package")
                                    .bold()
                                Text("Number of pieces in the package you used to buy.")
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.7))
                            }
                            
                            Spacer()
                            
                            Picker("", selection: $counterViewModel.piecesOfSnusPerPackage) {
                                ForEach(snusNumberRange, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 120)
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())

                        // Quit Date Picker
                        HStack {
                            DatePicker("Snus-free since", selection: $counterViewModel.quitDate)
                                .bold()
                                .colorMultiply(.blue)
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())

                        // Quit Reason Picker
                        VStack {
                            Text("I Quit Because")
                            Picker("", selection: $counterViewModel.quitReason) {
                                ForEach(quitReason, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .colorMultiply(.blue)
                        }
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())

                        VStack {
                            Spacer()
                            Text("")
                        }
                        .padding(.bottom, 200)
                        .listRowBackground(Color.blue.opacity(0.1).ignoresSafeArea())
                    }
                    .listStyle(.inset)
                    .scrollDisabled(true)
                    
                    Button("Save") {
                        counterViewModel.saveAllData()
                        counterViewModel.userHasQuitted = true
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
            piecesOfSnusPerPackage: 24,
            quitReason: "Health"
        )
        
        SnusUsageInputView(counterViewModel: mockCounterViewModel)
            .preferredColorScheme(.light) // Show only in light mode
    }
}


