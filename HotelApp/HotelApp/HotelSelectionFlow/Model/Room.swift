//
//  Room.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI

struct Room: Codable, Identifiable {
  var id: Int
  var name: String
  var price: Int
  var pricePer: String
  var peculiarities: [String]
  var imageUrls: [String]

  enum CodingKeys: String, CodingKey {
    case id, name, price, peculiarities
    case pricePer = "price_per"
    case imageUrls = "image_urls"
  }
}

struct RoomsResponse: Codable {
  var rooms: [Room]
}
