//
//  FloatingLabelTextField.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct FloatingLabelTextField: View {
  let shouldShowError: Bool
  let placeholder: String
  @Binding var text: String
  @State private var isEditing: Bool = false
  @FocusState private var isFocused

  private var isFullView: Bool {
    isEditing || !text.isEmpty
  }

  private var isErrorVisible: Bool {
    shouldShowError && text.isEmpty
  }

  var body: some View {
    ZStack(alignment: .leading) {
      Text(placeholder)
        .foregroundColor(
          isErrorVisible
          ? Color.white
          : HotelColor.foregroundGray.color
        )
        .font(.system(size: isFullView ? 12 : 17))
        .offset(x: 0, y: isFullView ? -14 : 0)
        .padding(.horizontal, isFullView ? 4 : 0)
        .animation(.easeInOut(duration: 0.2), value: isEditing)
        .padding(.horizontal, 10)

      TextField("", text: $text) { editing in
        withAnimation {
          isEditing = editing
        }
      }
      .submitLabel(.done)
      .focused($isFocused)
      .font(.system(size: 16))
      .padding(.horizontal, 10)
      .offset(y: 6)
      .animation(.default, value: text)
    }
    .frame(height: 52)
    .background(
      isErrorVisible
      ? HotelColor.error.color
      : HotelColor.background.color
    )
    .cornerRadius(10)
    .onTapGesture {
      isFocused = true
    }
  }
}

