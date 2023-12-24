//
//  HotelDetailView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-22.
//

import SwiftUI

struct HotelDetailView: View {
  var hotel: Hotel

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text("Об отеле")
          .font(.system(size: 22, weight: .medium))

        PeculiaritiesGridView(peculiarities: hotel.aboutTheHotel.peculiarities)

        Text(hotel.aboutTheHotel.description)
          .font(.system(size: 16))
          .padding(.top, 12)

      }
      .padding()
      .background(.white)
      .cornerRadius(12)
    }
  }
}
