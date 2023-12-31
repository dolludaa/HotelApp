//
//  TouristInfoViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol TouristInfoViewModelProtocol {
  func getFormattedDate(from date: Date?) -> String
  func validateFirstOrLastName(text: String) -> Bool
  func validatePassport(text: String) -> Bool
}
