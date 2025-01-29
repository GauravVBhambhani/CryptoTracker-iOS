//
//  Coin.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import Foundation

// Coin Gecko API Info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets

 OUTPUT:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 102342.16252745592,
     "market_cap": 2028043916372,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 2028043916372,
     "total_volume": 35467899007,
     "high_24h": 103541,
     "low_24h": 100272,
     "price_change_24h": -295.9049035538046,
     "price_change_percentage_24h": -0.2883,
     "market_cap_change_24h": -4492964049.859619,
     "market_cap_change_percentage_24h": -0.22105,
     "circulating_supply": 19816309,
     "total_supply": 19816309,
     "max_supply": 21000000,
     "ath": 108786,
     "ath_change_percentage": -5.60722,
     "ath_date": "2025-01-20T09:11:54.494Z",
     "atl": 67.81,
     "atl_change_percentage": 151333.71205,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-01-29T12:31:28.395Z",
     "sparkline_in_7d": {
       "price": [
         105064.6017722564,
         105274.67946424602,
       ]
     },
     "price_change_percentage_24h_in_currency": -0.288299371724534
   }
 */

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?

    let currentHoldings: Double? // how many coins the current user is holding. not downloading from internet, updated locally.

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }

    func updateCurrentHoldings(amount: Double) -> Coin {
        // this function is inside a Coin model, we can can reference all the values existing in the coin model
        // So we get a new coin model, with all the same data as the current coin, but with updated holdings
        // useful when we start updating personal portfolios
        return Coin(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }

    // holding amount * price
    var currentHoldingsValue: Double {
        return ( currentHoldings ?? 0 ) * currentPrice
    }

    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
