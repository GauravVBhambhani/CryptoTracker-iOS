//
//  CircleButtonView.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import SwiftUI

struct CircleButtonView: View {

    let iconName: String

    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: .black.opacity(0.25),
                radius: 10
            )
            .padding()
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "info")

        CircleButtonView(iconName: "plus")
            .colorScheme(.dark)
    }
}
