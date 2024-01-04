//
//  NavigationBackButton.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-29.
//

import SwiftUI

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
