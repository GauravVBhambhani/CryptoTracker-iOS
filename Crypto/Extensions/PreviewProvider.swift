//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import Foundation
import SwiftUI

//NEVER TO BE USED IN PRODUCTION

// SO that we dont havce to pass Coin model for each preview
extension PreviewProvider {

    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview() // singleton
    private init() {} // private becuase if public, someone else could initialize instance from somewhere else


    let homeVM = HomeViewModel()

    let coin = Coin(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 102342.16252745592,
        marketCap: 2028043916372,
        marketCapRank: 1,
        fullyDilutedValuation: 2028043916372,
        totalVolume: 35467899007,
        high24H: 103541,
        low24H: 100272,
        priceChange24H: -295.9049035538046,
        priceChangePercentage24H: -0.2883,
//        marketCapChange24H: -4492964049.859619,
//        marketCapChangePercentage24H: -0.22105,
        circulatingSupply: 19816309,
        totalSupply: 19816309,
        maxSupply: 21000000,
        ath: 108786,
        athChangePercentage: -5.60722,
        athDate: "2025-01-20T09:11:54.494Z",
        atl: 67.81,
        atlChangePercentage: 151333.71205,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2025-01-29T12:31:28.395Z",
        sparklineIn7D: SparklineIn7D(price: [
            105064.6017722564,
            105274.67946424602,
            104058.3806290983,
            104461.75496730869,
            104585.95000093221
          ]),
        priceChangePercentage24HInCurrency: -0.288299371724534,
        currentHoldings: 1
    )
}
