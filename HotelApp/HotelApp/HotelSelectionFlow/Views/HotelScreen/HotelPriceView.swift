//
//  HotelPriceView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct HotelPriceView: View {
  let minPrice: Int
  let priceForIt: String
  var showFromLabel: Bool

  var body: some View {
    VStack(alignment: .leading) {
      let price = minPrice.description.formattedAsCurrency()
      HStack(alignment: .bottom) {
        if showFromLabel {
          Text("от \(price) ₽")
            .font(.system(size: 30, weight: .semibold))
        } else {
          Text("\(price) ₽")
            .font(.system(size: 30, weight: .semibold))
        }

        Text(priceForIt)
          .foregroundStyle(HotelColor.foregroundGray.color)
          .font(.system(size: 16))
          .padding(.bottom, 3)
      }
      .padding(.bottom, 16)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
