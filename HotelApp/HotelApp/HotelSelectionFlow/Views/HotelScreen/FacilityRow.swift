//
//  FacilityRow.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct FacilityRow: View {
  let iconName: String
  let title: String
  let subtitle: String

  var body: some View {
    HStack {
      Image(iconName)
        .foregroundColor(.gray)
        .frame(width: 24, height: 24)
      VStack(alignment: .leading) {
        Text(title)
          .font(.system(size: 16, weight: .medium))
        Text(subtitle)
          .foregroundColor(HotelColor.foregroundGray.color)
          .font(.system(size: 14, weight: .medium))
      }
      Spacer()
      Image(systemName: "chevron.right")
        .foregroundColor(.black)
    }
    .padding(15)
  }
}
