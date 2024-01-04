//
//  GradientIndexPageControl.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-29.
//

import SwiftUI

struct GradientIndexPageControl: View {
  let numberOfPages: Int
  @Binding var selectedPage: Int
  
  private let selectedIndexOpacity = 1.0
  private let opacities = [0.27, 0.22, 0.17, 0.1, 0.05]
  
  var body: some View {
    HStack(spacing: 5) {
      ForEach(0..<numberOfPages, id: \.self) { index in
        let opacity = calculateOpacity(from: index)
        
        Button {
          selectedPage = index
        } label: {
          Circle()
            .tint(.black)
            .frame(width: 7, height: 7)
            .opacity(opacity)
            .contentShape(Rectangle())
        }
      }
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
    .background(.white)
    .cornerRadius(5)
  }
  
  private func calculateOpacity(from index: Int) -> Double {
    let opacity = opacities[safe: index] ?? opacities.last ?? 0
    return index == selectedPage ? selectedIndexOpacity : opacity
  }
}
