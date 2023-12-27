//
//  View.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

extension View {
  func standardStyle() -> some View {
    self
      .background(Color.white)
      .cornerRadius(15)
  }

  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape( RoundedCorner(radius: radius, corners: corners) )
  }
}


private struct RoundedCorner: Shape {

  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}
