//
//  CountryPickerViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol CountryPickerViewModelProtocol {
  var countries: [String] { get }
  func loadCountries()
}
