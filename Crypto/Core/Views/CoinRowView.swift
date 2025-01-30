//
//  CoinRowView.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import SwiftUI

struct CoinRowView: View {

    let coin: Coin
    let showHoldingsColumn: Bool

    var body: some View {
        HStack (spacing: 0) {

            leftColumn

            Spacer()

            if showHoldingsColumn {
                centerColumn
            }

            Spacer()

            rightColumn
        }
        .font(.subheadline)
    }
}

extension CoinRowView {

    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .frame(minWidth: 30)

            Circle()
                .frame(width: 30, height: 30)

            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.accent)
        }
    }

    private var centerColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()

            Text(coin.currentHoldings?.asNumberString() ?? "0.0")
        }
    }

    private var rightColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith2Decimals())
                .bold()
                .foregroundStyle(.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
    }
}

//#Preview {
//    CoinRowView()
//}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)

            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}
