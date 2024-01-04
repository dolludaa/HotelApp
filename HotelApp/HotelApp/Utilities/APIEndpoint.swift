//
//  APIEndpoint.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-29.
//

import Foundation

enum APIEndpoint {
  static let baseURL = "https://run.mocky.io/v3/"
  
  case hotelData
  case roomData
  case reservationData
  
  var url: String {
    switch self {
    case .hotelData:
      return APIEndpoint.baseURL + "d144777c-a67f-4e35-867a-cacc3b827473"
    case .roomData:
      return APIEndpoint.baseURL + "8b532701-709e-4194-a41c-1a903af00195"
    case .reservationData:
      return APIEndpoint.baseURL + "63866c74-d593-432c-af8e-f279d1a8d2ff"
    }
  }
}
