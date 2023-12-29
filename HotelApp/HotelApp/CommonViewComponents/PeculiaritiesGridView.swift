//
//  PeculiaritiesGridView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-22.
//

import SwiftUI
import SwiftUIFlow

struct PeculiaritiesGridView: View {
  var peculiarities: [String]

  var body: some View {

    VFlow(alignment: .leading) {
      ForEach(peculiarities, id: \.self) { peculiarity in
        Text(peculiarity)
          .foregroundColor(HotelColor.foregroundGray.color)
          .font(.system(size: 16, weight: .medium))
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
          .background(HotelColor.primaryGray.color)
          .cornerRadius(5)
      }
    }
  }
}
