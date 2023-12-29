//
//  String.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-29.
//

import Foundation

extension String {
    func formattedAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","

        guard let number = formatter.number(from: self) else { return self }

        formatter.groupingSeparator = " "
        formatter.decimalSeparator = "."
        return formatter.string(from: number) ?? self
    }
}
