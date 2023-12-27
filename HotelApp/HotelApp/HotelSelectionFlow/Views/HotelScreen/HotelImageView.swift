//
//  HotelImageView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import Foundation
import SwiftUI
import CachedAsyncImage

struct HotelImageView: View {
  var imageUrls: [String]

  var body: some View {
    TabView {
      ForEach(imageUrls, id: \.self) { imageUrl in
        if let url = URL(string: imageUrl) {
          CachedAsyncImage(url: url) { image in
            image.resizable()
          } placeholder: {
            Color.gray.opacity(0.3)
          }
          .cornerRadius(15)
        }
      }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}
