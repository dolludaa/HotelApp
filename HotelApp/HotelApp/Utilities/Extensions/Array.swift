//
//  Array.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-29.
//

import Foundation

extension Array {
  subscript (safe index: Int) -> Element? {
    guard indices.contains(index)
    else { return nil }
    return self[index]
  }
}
