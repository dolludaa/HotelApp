//
//  ContentView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import SwiftUI

struct HotelView: View {
  @StateObject private var viewModel = HotelViewModel()

  var body: some View {
    NavigationView {
      ScrollView {
        if let hotel = viewModel.hotel {
          VStack() {
            HotelImageView(imageUrls: hotel.imageUrls)
              .frame(height: 300)
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
              .padding(.vertical, 16)

            VStack(alignment: .leading) {
              HStack(spacing: 3) {
                Image(systemName: "star.fill")
                  .foregroundColor(Color.ratingColor)
                  .frame(height: 5)
                  .padding(.leading, 10)
                Text("5 \(hotel.ratingName)")
                  .foregroundStyle(Color.ratingColor)
                  .padding(.vertical, 5)
                  .padding(.trailing, 10)
              }
              .background(Color.ratingBackColor)
              .cornerRadius(5)

              Text(hotel.name)
                .fontWeight(.medium)
                .font(.system(size: 22))
                .padding(.vertical, 8)

              Button(action: {}) {
                Text(hotel.address)
                  .frame(alignment: .leading)
                  .foregroundColor(Color.adressForegroundColor)
                  .font(.system(size: 14))
              }
              HStack {
                Text("от \(hotel.minimalPrice) ₽")
                  .font(.system(size: 30))
                  .fontWeight(.semibold)

                 Text(hotel.priceForIt)
                  .foregroundStyle(Color.gray)
                  .font(.system(size: 16))
              }
              .padding(.vertical, 16)
            }

          }

          HotelDetailView(hotel: hotel)

          Spacer()

          NavigationLink(destination: RoomSelectionView()) {
            Text("К выбору номера")
              .frame(minWidth: 0, maxWidth: .infinity)
              .padding()
              .background(Color.blue)
              .foregroundColor(Color.white)
              .cornerRadius(10)
              .padding(.horizontal)
          }
        }

      }
      .navigationBarTitle("Отель", displayMode: .large)

    }
    .onAppear {
      viewModel.loadHotelData()
    }
  }
}

struct RoomSelectionView: View {
  var body: some View {
    Text("Экран выбора номера")
  }
}

struct HotelImageView: View {
  var imageUrls: [String]

  var body: some View {
    TabView {
      ForEach(imageUrls, id: \.self) { imageUrl in
        if let url = URL(string: imageUrl) {
          AsyncImage(url: url) { image in
            image.resizable()
          } placeholder: {
            Color.gray.opacity(0.3)
          }
          .cornerRadius(15)
          .padding(.horizontal, 16)

        }
      }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}


#Preview {
  HotelView()
}


import SwiftUI

struct HotelDetailView: View {
    var hotel: Hotel 

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Название раздела "Об отеле"
                Text("Об отеле")
                    .font(.title2)
                    .fontWeight(.semibold)

                // Создание двух колонок для особенностей отеля
                let columns = [
                    GridItem(.flexible(minimum: 10)),
                    GridItem(.flexible(minimum: 10))
                ]

                LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                    ForEach(hotel.aboutTheHotel.peculiarities, id: \.self) { peculiarity in
                        Text(peculiarity)
                            .font(.body)
                            .padding(.vertical, 2)
                    }
                }

                // Описание отеля
                Text(hotel.aboutTheHotel.description)
                    .font(.body)
                    .padding(.top, 5)
            }
            .padding()
        }
    }
}
