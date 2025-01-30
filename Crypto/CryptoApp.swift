//
//  CryptoApp.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import SwiftUI

@main
struct CryptoApp: App {

    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
