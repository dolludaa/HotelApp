//
//  extension .swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import Foundation

import SwiftUI

extension Color {

  static let ratingColor = Color(hex: 0xFFA800)
  static let ratingBackColor = Color(hex: 0xFFC700).opacity(0.2)
  static let adressForegroundColor = Color(hex: 0x0D72FF)
}

extension Color {
  init(hex: Int) {
    let red = Double((hex >> 16) & 0xFF) / 255.0
    let green = Double((hex >> 8) & 0xFF) / 255.0
    let blue = Double(hex & 0xFF) / 255.0
    self.init(red: red, green: green, blue: blue)
  }
}
