//
//  RoomViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol RoomViewModelProtocol {
  var roomURL: String { get }
  var rooms: [Room] { get }
  var errorMessage: String? { get }

  func fetchRooms()
}
