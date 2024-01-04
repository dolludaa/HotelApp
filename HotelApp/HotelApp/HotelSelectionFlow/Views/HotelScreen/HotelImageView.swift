//
//  HotelImageView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-20.
//

import Foundation
import SwiftUI
import CachedAsyncImage

import SwiftUI

struct HotelImageView: View {
  let imageUrls: [String]
  @State private var selectedPage = 0

  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $selectedPage) {
        ForEach(imageUrls.indices, id: \.self) { index in
          let imageUrl = imageUrls[index]

          if let url = URL(string: imageUrl) {
            CachedAsyncImage(url: url) { image in
              image.resizable()
            } placeholder: {
              Color.gray.opacity(0.3)
            }
            .cornerRadius(15)
            .tag(index)
          }
        }
      }
      .tabViewStyle(PageTabViewStyle())
      .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
      .cornerRadius(15)

      GradientIndexPageControl(
        numberOfPages: imageUrls.count,
        selectedPage: $selectedPage
      )
      .padding(.bottom, 8)
    }
  }
}
