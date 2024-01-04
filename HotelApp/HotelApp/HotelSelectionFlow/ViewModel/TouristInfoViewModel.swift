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
  private let nameRegex = /[^\p{L}' -]/
  private let passportRegex = /[^A-Za-z0-9]/

  init() {
    formatter.dateFormat = "dd / MM / YYYY"
  }

  func getFormattedDate(from date: Date?) -> String {
    guard let date else { return "" }
    return formatter.string(from: date)
  }

  func validateFirstOrLastName(text: String) -> Bool {
    validate(text: text, regex: nameRegex)
  }

  func validatePassport(text: String) -> Bool {
    validate(text: text, regex: passportRegex)
  }

  private func validate(text: String, regex: Regex<Substring>) -> Bool {
    let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
    return text.firstMatch(of: regex) == nil && !trimmedText.isEmpty
  }
}
