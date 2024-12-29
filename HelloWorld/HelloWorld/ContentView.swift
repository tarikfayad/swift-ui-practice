//
//  ContentView.swift
//  HelloWorld
//
//  Created by Tarik Fayad on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("iOS")
                .font(.system(size: 180))
                .fontWeight(.black)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.pink, .purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Link(destination: URL(string: "https://www.apple.com")!) {
                
                HStack(spacing: 16) {
                    Text("Link")
                    Image(systemName: "apple.logo")
                }
                
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(
                    Capsule()
                        .fill(Color.red)
                )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
