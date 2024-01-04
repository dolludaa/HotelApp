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
          Text("\(hotel.tourPrice.description.formattedAsCurrency()) ₽")
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        
        HStack {
          Text("Топливный сбор")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(hotel.fuelCharge.description.formattedAsCurrency()) ₽")
        }
        .padding(.horizontal, 16)
        
        HStack {
          Text("Сервисный сбор")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(hotel.serviceCharge.description.formattedAsCurrency()) ₽")
        }
        .padding(.horizontal, 16)
        
        let totalPrice = hotel.tourPrice + hotel.fuelCharge + hotel.serviceCharge
        
        HStack {
          Text("К оплате")
            .font(.system(size: 16))
            .foregroundStyle(HotelColor.foregroundGray.color)
          Spacer()
          Text("\(totalPrice.description.formattedAsCurrency()) ₽")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(HotelColor.secondaryBlue.color)
        }
        .padding(.horizontal, 16)
        
        MainButtonView(title: "Оплатить \(totalPrice.description.formattedAsCurrency()) ₽") {
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
