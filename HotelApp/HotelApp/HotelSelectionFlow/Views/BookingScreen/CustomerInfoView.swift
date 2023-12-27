//
//  CustomerInfoView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct CustomerInfoView: View {
  @State private var phoneNumber = ""
  @State private var email = ""
  @State private var isPhoneValid = true
  @State private var isEmailValid = true

  @State var viewModel: CustomerInfoViewViewModelProtocol

  @FocusState private var isEmailInFocus

  var body: some View {
    VStack(alignment: .leading) {
      Text("Информация о покупателе")
        .font(.system(size: 22, weight: .medium))

      FloatingLabelTextField(
        shouldShowError: false,
        placeholder: "Номер телефона",
        text: $phoneNumber
      )
      .keyboardType(.numberPad)
      .onChange(of: phoneNumber) { newValue in
        phoneNumber = viewModel.format(phone: newValue)
      }
      .keyboardType(.numberPad)

      FloatingLabelTextField(
        shouldShowError: false,
        placeholder: "Почта",
        text: $email
      )
      .focused($isEmailInFocus)
      .keyboardType(.emailAddress)
      .autocapitalization(.none)
      .onChange(of: email) { newValue in
        isEmailValid = viewModel.validateEmail(email: newValue)
      }
      .foregroundColor(!isEmailInFocus && !isEmailValid ? .red : .primary)

      Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
        .font(.system(size: 14))
        .foregroundColor(HotelColor.foregroundGray.color)
        .padding(.top, 8)
    }
  }
}
