//
//  ReusableButtonView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct MainButtonView: View {
  let title: String
  var action: () -> Void

  var body: some View {
    VStack {
      Text(title)
        .frame(maxWidth: .infinity)
        .padding()
        .background(HotelColor.secondaryBlue.color)
        .foregroundColor(.white)
        .cornerRadius(15)
//        .padding(.horizontal)
        .onTapGesture(perform: action)
    }
    .padding(.top, 10)
    .background(.white)
  }
}
