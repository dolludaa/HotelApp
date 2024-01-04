//
//  HotelMainInfoView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct HotelMainInfoView: View {
  let ratingScore: String
  let name: String
  let address: String
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 2) {
        Image(systemName: "star.fill")
          .foregroundColor(HotelColor.rating.color)
          .frame(height: 15)
          .padding(.leading, 10)
          .padding(.vertical, 5)
        
        Text("5 \(ratingScore)")
          .foregroundStyle(HotelColor.rating.color)
          .font(.system(size: 16, weight: .medium))
          .padding(.vertical, 5)
          .padding(.trailing, 10)
      }
      .background(HotelColor.yellowBackground.color)
      .cornerRadius(5)
      .padding(.top, 16)
      
      Text(name)
        .font(.system(size: 22, weight: .medium))
        .padding(.vertical, 8)
      
      Button(action: {}) {
        Text(address)
          .frame(alignment: .leading)
          .foregroundColor(HotelColor.secondaryBlue.color)
          .font(.system(size: 14, weight: .medium))
          .padding(.bottom, 16)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
