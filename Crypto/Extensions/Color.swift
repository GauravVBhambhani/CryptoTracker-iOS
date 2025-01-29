//
//  ColorTheme.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}


struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
}
