//
//  Page.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2024-01-03.
//

import Foundation

enum Page: Identifiable, Hashable {
  case hotel
  case room(title: String)
  case booking
  case orderConfirmation

  var id: String {
    switch self {
    case .hotel:
      "hotel"
    case .room(let title):
      "room \(title)"
    case .booking:
      "booking"
    case .orderConfirmation:
      "orderConfirmation"
    }
  }
}
