//
//  CustomerInfoViewViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol CustomerInfoViewViewModelProtocol {
  func format(phone: String) -> String
  func validateEmail(email: String) -> Bool
}
