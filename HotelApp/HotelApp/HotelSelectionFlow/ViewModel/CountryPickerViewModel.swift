//
//  CountryPickerViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

@Observable
class CountryPickerViewModel: CountryPickerViewModelProtocol {

  var countries: [String] = []

  func loadCountries() {
    countries = Locale.Region.isoRegions.compactMap { region in
      Locale.current.localizedString(forRegionCode: region.identifier)
    }.sorted()
  }
}
