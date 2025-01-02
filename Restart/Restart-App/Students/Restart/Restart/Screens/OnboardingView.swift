//
//  OnboardingView.swift
//  Restart
//
//  Created by Tarik Fayad on 1/2/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true // If the key already exists in user defaults it shouldn't overwrite the value.
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }
        } //: VSTACK
    }
}

#Preview {
    OnboardingView()
}
