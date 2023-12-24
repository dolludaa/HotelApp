//
//  ReservationViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class ReservationViewModel: ObservableObject {
  var hotelBooking: HotelBooking?
  var isLoading = false
  var errorMessage: String?
  var cancellables: Set<AnyCancellable> = []

  init() {
    fetchRooms()
  }

  func fetchRooms() {
    guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else {
      errorMessage = "Некорректный URL"
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: HotelBooking.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        switch completion {
        case .finished:
          self?.isLoading = false
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
          self?.isLoading = false
        }
      }, receiveValue: { [weak self] booking in
        self?.hotelBooking = booking
      })
      .store(in: &cancellables)
  }
}

