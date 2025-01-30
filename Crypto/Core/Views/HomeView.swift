//
//  HomeView.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/28/25.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = true

    var body: some View {
        VStack {

            homeHeader

            columnTitles

            if !showPortfolio {
                allCoinsList
                    .transition(.move(edge: .leading)) // animation
            }

            if showPortfolio {
                portfolioCoinsList
                    .transition(.move(edge: .trailing))
            }

            Spacer(minLength: 0) // can be zero if required
        }
        .toolbarVisibility(.hidden)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(CircleButtonAnimationView(animate: $showPortfolio))

            Spacer()

            Text(showPortfolio ? "Portfolio" : "Live")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)

            Spacer()

            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }

    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            Text(showPortfolio ? "Holdings" : "")
            Spacer()
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(.secondaryText)
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }

    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}

//#Preview {
//    NavigationView {
//        HomeView()
//            .toolbar(.hidden)
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbarVisibility(.hidden)
        }
        .environmentObject(dev.homeVM)
    }
}
