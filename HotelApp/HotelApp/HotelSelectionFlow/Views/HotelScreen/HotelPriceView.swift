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

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("от \(minPrice) ₽")
          .font(.system(size: 30, weight: .semibold))

        Text(priceForIt)
          .foregroundStyle(HotelColor.foregroundGray.color)
          .font(.system(size: 16))
      }
      .padding(.bottom, 16)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  HotelSelectionCoordinatorView(startPage: .hotel)
}
