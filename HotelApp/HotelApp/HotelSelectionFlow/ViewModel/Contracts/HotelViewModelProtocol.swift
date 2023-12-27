//
//  HotelViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol HotelViewModelProtocol {
  var hotel: Hotel? { get }
  var isLoading: Bool { get }
  var errorMessage: String? { get }

  func loadHotelData()
}
