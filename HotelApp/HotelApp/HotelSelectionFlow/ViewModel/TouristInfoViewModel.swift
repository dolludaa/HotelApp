//
//  TouristInfoViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

@Observable
class TouristInfoViewModel: TouristInfoViewModelProtocol {

  private let formatter = DateFormatter()

  init() {
    formatter.dateFormat = "dd / MM / YYYY"
  }

  func getFormattedDate(from date: Date?) -> String {
    guard let date else { return "" }
    return formatter.string(from: date)
  }
}
