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

  private let httpService = HTTPService()

  func fetchRooms() {
    httpService.loadData(from: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195", decodeType: RoomsResponse.self) { [weak self] result in
      switch result {
      case .success(let roomResponse):
        self?.rooms = roomResponse.rooms
      case .failure(let error):
        self?.errorMessage = error.localizedDescription
      }
    }
  }
}
