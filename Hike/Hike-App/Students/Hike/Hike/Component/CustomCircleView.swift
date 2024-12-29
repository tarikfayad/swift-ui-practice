//
//  CustomCircleView.swift
//  Hike
//
//  Created by Tarik Fayad on 11/5/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var animateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium, .customSalmonLight],
                                   startPoint: animateGradient ? .topLeading : .bottomLeading,
                                   endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
            }
            
            MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
