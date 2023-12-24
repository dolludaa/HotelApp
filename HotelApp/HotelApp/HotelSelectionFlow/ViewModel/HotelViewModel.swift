//
//  HotelViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class HotelViewModel {
  var hotel: Hotel?
  var isLoading = true
  var errorMessage: String?
  private var cancellables = Set<AnyCancellable>()

  func loadHotelData() {
    guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {
      errorMessage = "Некорректный URL"
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: Hotel.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        switch completion {
        case .finished:
          self?.isLoading = false
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
          self?.isLoading = false
        }
      }, receiveValue: { [weak self] hotel in
        self?.hotel = hotel
      })
      .store(in: &cancellables)
  }
}
