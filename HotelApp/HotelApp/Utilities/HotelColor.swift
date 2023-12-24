//
//  HotelColor.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI

enum HotelColor {
  case rating
  case ratingBack
  case adressForeground
  case background
  case primaryGrey
  case foregroundGray
  case primaryBlue

  var color: Color {
    switch self {
    case .rating:
      Color(hex: 0xFFA800)
    case .ratingBack:
      Color(hex: 0xFFC700).opacity(0.2)
    case .adressForeground:
      Color(hex: 0x0D72FF)
    case .background:
      Color(hex: 0xF1F1F1)
    case .primaryGrey:
      Color(hex: 0xFBFBFC)
    case .foregroundGray:
      Color(hex: 0x828796)
    case .primaryBlue:
      Color(hex: 0xe7f1ff)
    }
  }
}
