//
//  HotelModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import SwiftUI

struct Hotel: Decodable, Identifiable {
  var id: Int
  var name: String
  var adress: String
  var minimalPrice: Int
  var priceForIt: String
  var rating: Int
  var ratingName: String
  var imageUrls: [String]
  var aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel: Decodable {
  var description: String
  var peculiarities: [String]
}
