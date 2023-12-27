//
//  OrderConfirmationView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct OrderConfirmationView: View {

  let orderNumber = String(UUID().uuidString.prefix(8))
  @Environment(HotelSelectionCoordinator.self) private var coordinator

  var body: some View {
    VStack {
      Spacer()

      Image("partyEmoji")
        .frame(width: 100, height: 100)
        .padding()

      Text("Ваш заказ принят в работу")
        .font(.system(size: 22, weight: .medium))
        .fontWeight(.bold)
        .padding(.bottom, 20)

      Text("Подтверждение заказа №\(orderNumber) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
        .foregroundStyle(HotelColor.foregroundGray.color)
        .font(.system(size: 16))
        .padding(.horizontal, 23)
        .multilineTextAlignment(.center)

      Spacer()

      MainButtonView(title: "Супер") {
        coordinator.popToRoot()
      }
      .padding(.horizontal, 16)
    }
    .navigationBarBackButtonHidden(true)
  }
}

#Preview {
  HotelSelectionCoordinatorView(startPage: .orderConfirmation)
}
