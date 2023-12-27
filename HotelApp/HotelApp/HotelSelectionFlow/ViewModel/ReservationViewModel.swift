//
//  ReservationViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

@Observable
class ReservationViewModel: ReservationViewModelProtocol {
  var hotelBooking: HotelBooking?
  var isLoading = false
  var errorMessage: String?
  var tourists: [Tourist] = []
  var isMaxTourists: Bool { tourists.count >= maxTouristNumber }
  var isTouristsDataCompleted: Bool {
    tourists.allSatisfy {
      !$0.citizenship.isEmpty &&
      !$0.firstName.isEmpty &&
      !$0.lastName.isEmpty &&
      !$0.passportNumber.isEmpty &&
      $0.birthDate != nil &&
      $0.passportExpiry != nil
    }
  }

  private let maxTouristNumber = 10
  private let httpService: HTTPServiceProtocol

  init(httpService: HTTPServiceProtocol) {
    self.httpService = httpService
  }

  func fetchRooms() {
    httpService.loadData(
      from: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff",
      decodeType: HotelBooking.self
    ) { [weak self] result in
      guard let self else { return }

      switch result {
      case .success(let booking):
        hotelBooking = booking
        if tourists.isEmpty {
          addTourist()
        }
      case .failure(let error):
        errorMessage = error.localizedDescription
      }
    }
  }

  func addTourist() {
    guard tourists.count < maxTouristNumber
    else { return }

    let ordinal = convertToOrdinal(number: tourists.count + 1)
    var tourist = Tourist()
    tourist.numberName = ordinal.capitalized + " турист"
    tourists.append(tourist)
  }

  func convertToOrdinal(number: Int) -> String {
    switch number {
    case 1: "первый"
    case 2: "второй"
    case 3: "третий"
    case 4: "четвёртый"
    case 5: "пятый"
    case 6: "шестой"
    case 7: "седьмой"
    case 8: "восьмой"
    case 9: "девятый"
    case 10: "десятый"
    default:
      ""
    }
  }

  func highlightUncompletedTourists() {
    for i in tourists.indices {
      tourists[i].shouldShowError = true
    }
  }
}

