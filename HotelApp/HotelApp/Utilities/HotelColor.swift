//
//  HotelColor.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI

enum HotelColor {
  case rating
  case yellowBackground
  case secondaryBlue
  case background
  case primaryGray
  case foregroundGray
  case primaryBlue
  case error

  var color: Color {
    switch self {
    case .rating:
      Color(hex: 0xFFA800)
    case .yellowBackground:
      Color(hex: 0xFFC700).opacity(0.2)
    case .secondaryBlue:
      Color(hex: 0x0D72FF)
    case .background:
      Color(hex: 0xF1F1F1)
    case .primaryGray:
      Color(hex: 0xFBFBFC)
    case .foregroundGray:
      Color(hex: 0x828796)
    case .primaryBlue:
      Color(hex: 0xe7f1ff)
    case .error:
      Color(hex: 0xEB5757 )
    }
  }
}
