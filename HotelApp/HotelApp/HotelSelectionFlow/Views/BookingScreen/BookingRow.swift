//
//  BookingRow.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct BookingRow: View {

  let key: String
  let value: String

  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .top) {
        Text(key)
          .font(.system(size: 16))
          .foregroundColor(HotelColor.foregroundGray.color)
          .frame(width: geometry.size.width * 0.4, alignment: .leading)

        Text(value)
          .lineLimit(nil)
          .font(.system(size: 16))
          .fixedSize(horizontal: false, vertical: true)
          .frame(width: geometry.size.width * 0.6, alignment: .leading)
      }
    }
  }
}
