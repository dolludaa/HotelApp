//
//  PeculiaritiesGridView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-22.
//

import SwiftUI

struct PeculiaritiesGridView: View {
  var peculiarities: [String]

  private let columns = [
    GridItem(.flexible(minimum: 10)),
    GridItem(.flexible(minimum: 10))
  ]
  
  var body: some View {
    LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
      ForEach(peculiarities, id: \.self) { peculiarity in
        Text(peculiarity)
          .foregroundColor(HotelColor.foregroundGray.color)
          .font(.system(size: 16, weight: .medium))
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(HotelColor.primaryGrey.color)
          .cornerRadius(5)
      }
    }
  }
}
