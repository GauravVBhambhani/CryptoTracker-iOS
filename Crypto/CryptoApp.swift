//
//  CryptoApp.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
