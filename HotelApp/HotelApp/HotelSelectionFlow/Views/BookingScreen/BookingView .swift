//
//  BookingView .swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI
import Combine

struct BookingView: View {
  @State var viewModel: ReservationViewModelProtocol

  var body: some View {
    ScrollView {
      VStack {
        VStack(alignment: .leading) {
          if let bookingHotel = viewModel.hotelBooking {

            HotelMainInfoView(ratingScore: bookingHotel.ratingName, name: bookingHotel.hotelName, address: bookingHotel.hotelAdress)
              .padding(.horizontal, 16)
              .standardStyle()

            VStack {
              BookingDataBlockView(booking: bookingHotel)
            }
            .standardStyle()

            CustomerInfoView(viewModel: CustomerInfoViewViewModel())
              .padding(16)
              .standardStyle()

            touristsView

            addTouristButton

            TotalPriceView(viewModel: viewModel)
              .standardStyle()
          }
        }
        .padding(.top, 8)
        .background(HotelColor.background.color)
      }
      .background(.white)
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationBackButton(color: .black)
    .task {
      viewModel.fetchRooms()
    }
  }

  private var touristsView: some View {
    ForEach(viewModel.tourists.indices, id: \.self) { index in
      TouristInfoView(tourist: $viewModel.tourists[index], viewModel: TouristInfoViewModel())
    }
  }

  @ViewBuilder
  private var addTouristButton: some View {
    if !viewModel.isMaxTourists {
      AddTouristView(title: "Добавить туриста") {
        viewModel.addTourist()
      }
      .padding(.vertical, 13)
      .standardStyle()
    }
  }
}
