//
//  CoinDataService.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import Foundation
import Combine

class CoinDataService: ObservableObject {

    @Published var allCoins: [Coin] = [] // this is a Publisher, and it can have subscribers.

    var coinSubscription: AnyCancellable?

    init() {
        getCoins()
    }

    // private because we'll be calling getCoins() from within this class.
    private func getCoins() {

        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }

        // SUBSCRIBER
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder()) //the data is goin to be array of coins, in JSON format.
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
