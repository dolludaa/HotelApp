//
//  HotelViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class HotelViewModel: HotelViewModelProtocol {
  var hotel: Hotel?
  var isLoading = false
  var errorMessage: String?
  private let httpService = HTTPService()

  func loadHotelData() {
    isLoading = true
    httpService.loadData(from: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473", decodeType: Hotel.self) { [weak self] result in
      self?.isLoading = false
      switch result {
      case .success(let hotel):
        self?.hotel = hotel
      case .failure(let error):
        self?.errorMessage = error.localizedDescription
      }
    }
  }
}
