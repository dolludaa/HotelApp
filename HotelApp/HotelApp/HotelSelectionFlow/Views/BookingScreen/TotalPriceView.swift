//
//  TotalPriceView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-25.
//

import Foundation
import SwiftUI

struct TotalPriceView: View {

  let viewModel: ReservationViewModelProtocol
  @Environment(HotelSelectionCoordinator.self) private var coordinator

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      if let hotel = viewModel.hotelBooking {
        HStack {
          Text("Тур")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(hotel.tourPrice) ₽")
        }

        HStack {
          Text("Топливный сбор")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(hotel.fuelCharge) ₽")
        }

        HStack {
          Text("Сервисный сбор")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(hotel.serviceCharge) ₽")
        }

        let totalPrice = hotel.tourPrice + hotel.fuelCharge + hotel.serviceCharge

        HStack {
          Text("К оплате")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(totalPrice) ₽")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(HotelColor.secondaryBlue.color)
        }

        MainButtonView(title: "Оплатить \(totalPrice) ₽") {
          if viewModel.isTouristsDataCompleted {
            coordinator.push(.orderConfirmation)
          } else {
            viewModel.highlightUncompletedTourists()
          }
        }
      }
    }
  }
}
