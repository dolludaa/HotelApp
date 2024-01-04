//
//  HotelView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import SwiftUI

struct HotelView: View {
  
  @State var viewModel: HotelViewModelProtocol
  @Environment(HotelSelectionCoordinator.self) private var coordinator
  
  var body: some View {
    ScrollView {
      if let hotel = viewModel.hotel {
        VStack {
          VStack(alignment: .leading) {
            HotelImageView(imageUrls: hotel.imageUrls)
              .frame(height: 257)
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HotelMainInfoView(ratingScore: hotel.ratingName, name: hotel.name, address: hotel.adress)
            
            HotelPriceView(minPrice: hotel.minimalPrice, priceForIt: hotel.priceForIt, showFromLabel: true)
              .padding(.bottom, 16)

          }
          .padding(.horizontal, 16)
          .background(Color.white)
          .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
          
          HotelDetailView(hotel: hotel)
          
          VStack(spacing: 0) {
            Divider()
            MainButtonView(title: "К выбору номера") {
              coordinator.push(.room(title: hotel.name))
            }
          }.frame(maxWidth: .infinity)
        }
        .background(HotelColor.background.color)
      }
    }
    .background(.white)
    .onAppear {
      viewModel.loadHotelData()
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbarBackground(Color.white, for: .navigationBar)
  }
}

