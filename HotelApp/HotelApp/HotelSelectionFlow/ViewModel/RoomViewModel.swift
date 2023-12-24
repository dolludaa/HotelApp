//
//  RoomViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class RoomViewModel: ObservableObject {
  var rooms: [Room] = []
  var errorMessage: String?
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
