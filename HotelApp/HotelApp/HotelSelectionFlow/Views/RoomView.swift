//
//  RoomView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-21.
//

import Foundation
import SwiftUI

struct RoomsView: View {
  @State private var viewModel = RoomViewModel()

  var body: some View {
      ScrollView {
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
                .foregroundColor(HotelColor.adressForeground.color)
                .background(HotelColor.primaryBlue.color)

              }
              .cornerRadius(5)
              .padding(.horizontal, 16)

              HStack {
                Text("\(room.price) ₽")
                  .font(.system(size: 30))
                  .fontWeight(.semibold)

                Text(room.pricePer)
                  .foregroundStyle(Color.gray)
                  .font(.system(size: 16))
              }
              .padding(16)

              NavigationLink(destination: EmptyView()) {
                Text("Выбрать номер")
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .padding()
                  .background(Color.blue)
                  .foregroundColor(Color.white)
                  .cornerRadius(15)
                  .padding(.horizontal, 16)
              }
            }
            .background(.white)
          }
        }
      }
      .background(HotelColor.primaryGrey.color)
  }

  @ViewBuilder
  private func getHotelImageView(room: Room) -> some View {
    if !room.imageUrls.isEmpty {
      HotelImageView(imageUrls: room.imageUrls)
        .frame(height: 300)
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
  }
}


#Preview {
  RoomsView()
}


