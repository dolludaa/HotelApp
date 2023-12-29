//
//  ReservationViewModelProtocol.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

protocol ReservationViewModelProtocol {
  var reservationURL: String { get }
  var hotelBooking: HotelBooking? { get }
  var tourists: [Tourist] { get set }
  var isLoading: Bool { get }
  var errorMessage: String? { get }
  var isMaxTourists: Bool { get }
  var isTouristsDataCompleted: Bool { get }

  func fetchRooms()
  func addTourist()
  func convertToOrdinal(number: Int) -> String
  func highlightUncompletedTourists()
}
