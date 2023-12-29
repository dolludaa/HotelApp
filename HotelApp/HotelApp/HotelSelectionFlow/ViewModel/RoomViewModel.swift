//
//  RoomViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class RoomViewModel: RoomViewModelProtocol {
  var rooms: [Room] = []
  var errorMessage: String?
  var roomURL = APIEndpoint.roomData.url

  private let httpService = HTTPService()
  private var cancellables = Set<AnyCancellable>()

  func fetchRooms() {
    httpService.loadData(from: roomURL, decodeType: RoomsResponse.self)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] completion in
        if case let .failure(error) = completion {
          self?.errorMessage = error.localizedDescription
        }
      }, receiveValue: { [weak self] roomResponse in
        self?.rooms = roomResponse.rooms
      })
      .store(in: &cancellables)
  }
}

