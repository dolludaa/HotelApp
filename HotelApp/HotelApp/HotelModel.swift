//
//  HotelModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import SwiftUI
import Combine


struct Hotel: Decodable, Identifiable {
  var id: Int
  var name: String
  var address: String
  var minimalPrice: Int
  var priceForIt: String
  var rating: Int
  var ratingName: String
  var imageUrls: [String]
  var aboutTheHotel: AboutTheHotel

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case address = "adress"
    case minimalPrice = "minimal_price"
    case priceForIt = "price_for_it"
    case rating
    case ratingName = "rating_name"
    case imageUrls = "image_urls"
    case aboutTheHotel = "about_the_hotel"
  }

  struct AboutTheHotel: Decodable {
    var description: String
    var peculiarities: [String]

    enum CodingKeys: String, CodingKey {
      case description
      case peculiarities
    }
  }
}


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
