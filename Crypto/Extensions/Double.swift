//
//  Double.swift
//  Crypto
//
//  Created by Gaurav Bhambhani on 1/29/25.
//

import Foundation

extension Double {

    /// Converts a Double into a currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // Default Value
//        formatter.currencyCode = "usd"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    /// Converts a Double into a currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }

    /// Converts a Double into a currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter4: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // Default Value
//        formatter.currencyCode = "usd"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 4
        return formatter
    }

    /// Converts a Double into a currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith4Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter4.string(from: number) ?? "$0.00"
    }

    /// Converts a Double into a String representation
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    /// Converts a Double into a String representation
    /// ```
    /// Convert "1.23" to "1.23%"
    /// ```
    func asPercentageString() -> String {

        return asNumberString() + "%"
    }
}
