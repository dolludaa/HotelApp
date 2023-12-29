//
//  RoomView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-21.
//

import Foundation
import SwiftUI

struct RoomsView: View {
  @Environment(HotelSelectionCoordinator.self) private var coordinator
  @State var viewModel: RoomViewModelProtocol

  var body: some View {
    ScrollView {
      VStack {
        VStack(spacing: 8) {
          ForEach(viewModel.rooms) { room in
            VStack(alignment: .leading) {
              getHotelImageView(room: room)

              Text(room.name)
                .font(.system(size: 22, weight: .medium))
                .padding(.horizontal, 16)

              PeculiaritiesGridView(peculiarities: room.peculiarities)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

              Button(action: {}) {
                HStack(spacing: 2) {
                  Text("Подробнее о номере")
                    .frame(alignment: .leading)
                    .font(.system(size: 16, weight: .medium))
                  Image(systemName: "chevron.right")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .foregroundColor(HotelColor.secondaryBlue.color)
                .background(HotelColor.primaryBlue.color)
              }
              .cornerRadius(5)
              .padding(.horizontal, 16)

              HotelPriceView(minPrice: room.price, priceForIt: room.pricePer, showFromLabel: false)
                .padding(.horizontal, 16)

              MainButtonView(title: "Выбрать номер") {
                coordinator.push(.booking)
              }
              .padding(.bottom, 16)
            }
            .background(.white)
            .cornerRadius(15)
          }
        }
        .padding(.top, 8)
      }
      .background(HotelColor.background.color)
    }
    .background(.white)
    .navigationBarTitleDisplayMode(.inline)
    .task {
      viewModel.fetchRooms()
    }
  }

  @ViewBuilder
  private func getHotelImageView(room: Room) -> some View {
    if !room.imageUrls.isEmpty {
      HotelImageView(imageUrls: room.imageUrls)
        .frame(height: 275)
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
  }
}


#Preview {
  HotelSelectionCoordinatorView(startPage: .room(title: "my title"))
}

