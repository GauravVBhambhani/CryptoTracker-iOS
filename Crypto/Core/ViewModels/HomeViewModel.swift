//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import Foundation
import Combine

// ObservableObject: so we can observe it from our view
class HomeViewModel: ObservableObject {

    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []

    private let dataService = CoinDataService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
