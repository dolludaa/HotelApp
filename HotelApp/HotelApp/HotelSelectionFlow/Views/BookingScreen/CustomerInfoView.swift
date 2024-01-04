//
//  CustomerInfoView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import SwiftUI

struct CustomerInfoView: View {

  enum States {
    case email
  }

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
        shouldShowError: .constant(false),
        placeholder: "Номер телефона",
        text: $phoneNumber
      )
      .keyboardType(.numberPad)
      .onChange(of: phoneNumber) { _, newValue in
        phoneNumber = viewModel.format(phone: newValue)
      }
      .keyboardType(.numberPad)

      FloatingLabelTextField(
        shouldShowError: .constant(!isEmailInFocus && !isEmailValid),
        placeholder: "Почта",
        text: $email
      )
      .focused($isEmailInFocus)
      .keyboardType(.emailAddress)
      .autocapitalization(.none)
      .onChange(of: email) { _, newValue in
        isEmailValid = viewModel.validateEmail(email: newValue)
      }

      Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
        .font(.system(size: 14))
        .foregroundColor(HotelColor.foregroundGray.color)
        .padding(.top, 8)
    }
    .onTapGesture {
          hideKeyboard()
        }
  }
}
