//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import SwiftUI

struct CircleButtonAnimationView: View {

//    @State private var animate: Bool = false
    // instead of handling 'animate' is true/false on appear within the view,
    // we can change it to a Binding, so that we can change its value from other views (HomeView)
    // and bindings can not be private (makes sense)

    @Binding var animate: Bool

    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100)
}
