//
//  TestProgress.swift
//  Slutta231223
//
//  Created by Hossein Sharifi on 24/12/2023.
//

import SwiftUI

import SwiftUI

// Define a custom progress view style
struct CustomProgressViewStyle: ProgressViewStyle {
    var trackColor: Color
    var progressColor: Color
    var height: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // The track (background of the progress bar)
                RoundedRectangle(cornerRadius: height / 2.0)
                    .frame(width: geometry.size.width, height: height)
                    .foregroundColor(trackColor)
                
                // The progress (filled part of the progress bar)
                RoundedRectangle(cornerRadius: height / 2.0)
                    .frame(width: geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0), height: height)
                    .foregroundColor(progressColor)
                    .animation(.linear, value: configuration.fractionCompleted)
            }
            .cornerRadius(height / 2.0) // Ensures the corners are rounded
        }
    }
}

struct TestProgress: View {
    @State private var progress = 0.5 // Halfway filled for demonstration

    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(CustomProgressViewStyle(trackColor: .gray, progressColor: .blue, height: 8))
            .frame(width: 200) // Width of the entire progress view
            .padding()
    }
}



#Preview {
    TestProgress()
}
