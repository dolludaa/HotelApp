//
//  HotelViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import Foundation
import SwiftUI
import Combine

class HotelViewModel: ObservableObject {
  @Published var hotel: Hotel?
  @Published var isLoading = true
  @Published var errorMessage: String?
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


class RoomViewModel: ObservableObject {
  @Published var rooms: [Room] = []
  @Published var errorMessage: String?
  var cancellables: Set<AnyCancellable> = []

  init() {
    fetchRooms()
  }

  func fetchRooms() {
    guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else {
      errorMessage = "Некорректный URL"
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .handleEvents(receiveOutput: { data in
        print(String(data: data, encoding: .utf8) ?? "Invalid data encoding")
      })
      .decode(type: RoomsResponse.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        switch completion {
        case .failure(let error):
          self?.errorMessage = error.localizedDescription
        case .finished:
          break
        }
      }, receiveValue: { [weak self] response in
        self?.rooms = response.rooms
      })
      .store(in: &cancellables)
  }
}
