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
  var hotelURL = APIEndpoint.hotelData.url
  var hotel: Hotel?
  var isLoading = false
  var errorMessage: String?

  private let httpService = HTTPService()
  private var cancellables = Set<AnyCancellable>()

  func loadHotelData() {
    isLoading = true
    httpService.loadData(from: hotelURL, decodeType: Hotel.self)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        self?.isLoading = false
        if case let .failure(error) = completion {
          self?.errorMessage = error.localizedDescription
        }
      }, receiveValue: { [weak self] hotel in
        self?.hotel = hotel
      })
      .store(in: &cancellables)
  }
}
