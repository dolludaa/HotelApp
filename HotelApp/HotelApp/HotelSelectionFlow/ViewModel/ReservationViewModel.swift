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
  var reservationURL = APIEndpoint.reservationData.url
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
  private var cancellables = Set<AnyCancellable>()


  init(httpService: HTTPServiceProtocol) {
    self.httpService = httpService
  }

  func fetchRooms() {
    isLoading = true
    httpService.loadData(from: reservationURL, decodeType: HotelBooking.self)
      .sink(
        receiveCompletion: { [weak self] (completion: Subscribers.Completion<Error>) in
          guard let self = self else { return }
          self.isLoading = false
          switch completion {
          case .finished:
            break
          case .failure(let error):
            self.errorMessage = error.localizedDescription
          }
        },
        receiveValue: { [weak self] (booking: HotelBooking) in
          guard let self = self else { return }
          self.hotelBooking = booking
          if self.tourists.isEmpty {
            self.addTourist()
          }
        }
      )
      .store(in: &cancellables)
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

