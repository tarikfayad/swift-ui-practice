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
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpactiy), lineWidth: 40)
                .frame(width: 260, alignment: .center)
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpactiy), lineWidth: 80)
                .frame(width: 260, alignment: .center)
        } //: ZSTACK
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(ShapeColor: .white, ShapeOpactiy: 0.2)
    }
}
