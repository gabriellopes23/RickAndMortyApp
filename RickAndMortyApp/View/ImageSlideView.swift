//
//  ImageSlideView.swift
//  RickAndMortyApp
//
//  Created by Gabriel Lopes on 23/05/24.
//

import SwiftUI

struct ImageSlideView: View {
    @State private var currentImageIndex = 0
    
    var body: some View {
        Image(imagesRickAndMorty[currentImageIndex])
            .resizable()
            .scaledToFit()
            .cornerRadius(25)
            .padding(.horizontal, 5)
            .onAppear {
                startTime()
            }
    }
    
    func startTime() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            withAnimation {
                currentImageIndex = Int.random(in: 0..<imagesRickAndMorty.count)
            }
        }
    }
}

#Preview {
    ImageSlideView()
}
