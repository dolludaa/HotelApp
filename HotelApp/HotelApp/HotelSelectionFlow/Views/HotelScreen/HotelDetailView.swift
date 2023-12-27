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

        VStack {
          VStack(spacing: 0) {
            FacilityRow(iconName: "happyEmoji", title: "Удобства", subtitle: "Самое необходимое")
            Divider()
            FacilityRow(iconName: "includedEmoji", title: "Что включено", subtitle: "Самое необходимое")
            Divider()
            FacilityRow(iconName: "notIncludedEmoji", title: "Что не включено", subtitle: "Самое необходимое")
          }
          .background(HotelColor.primaryGray.color)
          .cornerRadius(15)
        }
        .background(.white)
      }
      .padding()
      .background(.white)
      .cornerRadius(12)
    }
  }
}
