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
              .frame(height: 275)
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

            HotelMainInfoView(ratingScore: hotel.ratingName, name: hotel.name, address: hotel.adress)

            HotelPriceView(minPrice: hotel.minimalPrice, priceForIt: hotel.priceForIt, showFromLabel: true)

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

#Preview {
  HotelSelectionCoordinatorView(startPage: .hotel)
}





struct NavigationBackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode
    var color: UIColor
    var text: String?

    func body(content: Content) -> some View {
        return content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: Button(action: {  presentationMode.wrappedValue.dismiss() }, label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(color))

                        if let text = text {
                            Text(text)
                                .foregroundColor(Color(color))
                        }
                    }
                })
            )
    }
}

extension View {
    func navigationBackButton(color: UIColor, text: String? = nil) -> some View {
        modifier(NavigationBackButton(color: color, text: text))
    }
}
