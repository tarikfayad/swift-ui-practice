//
//  OnboardingView.swift
//  Restart
//
//  Created by Tarik Fayad on 1/2/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true // If the key already exists in user defaults it shouldn't overwrite the value.
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0) // or .zero
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            VStack (spacing: 20) {
                // MARK: - HEADER
                Spacer()
                VStack(spacing: 20) {
                    Text("Share.")
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundStyle(.white)
                    
                    Text("It's not how much we give but\nhow much love we put into giving.")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1:0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - BODY
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpactiy: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1:0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    imageOffset = gesture.translation
                                }
                        )
                } //: BODY
                
                // MARK: - FOOTER
                ZStack {
                    // Background
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // Call to action
                    Text("Get Started")
                        .font(.title3)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // Capsule
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset)
                        
                        Spacer()
                    }
                    
                    // Draggable Circle
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))

                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                        
                                        print(buttonOffset)
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(Animation.easeInOut(duration: 0.6)) {
                                        if buttonOffset < buttonWidth/2 {
                                            buttonOffset = 0
                                            isOnboardingViewActive = true
                                        } else {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }
                                    }
                                })
                        )
                        
                        Spacer()
                    }
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1:0)
                .offset(y: isAnimating ? 0:40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            isAnimating = true // Begins animating on appearance
        })
    }
}

#Preview {
    OnboardingView()
}
