//
//  CircleGroupView.swift
//  Restart
//
//  Created by Tarik Fayad on 1/3/25.
//

import SwiftUI

struct CircleGroupView: View {
    @State var ShapeColor: Color
    @State var ShapeOpactiy: Double
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpactiy), lineWidth: 40)
                .frame(width: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpactiy), lineWidth: 80)
                .frame(width: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(ShapeColor: .white, ShapeOpactiy: 0.2)
    }
}
