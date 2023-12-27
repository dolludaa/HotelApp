//
//  TouristInfoView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation
import SwiftUI

struct TouristInfoView: View {
  @Binding var tourist: Tourist
  @State private var isFieldsVisible = true
  @State var isBirthDatePickerPresented = false
  @State var isExpirationDatePickerPresented = false

  @State var viewModel: TouristInfoViewModelProtocol

  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        HStack {
          Text(tourist.numberName).font(.system(size: 22, weight: .medium))
          Spacer()
          Button {
            isFieldsVisible.toggle()
          } label: {
            Text(isFieldsVisible ? Image(systemName: "chevron.up") : Image(systemName: "chevron.down"))
              .padding(.bottom, 10)
              .padding(.top, 8)
              .padding(.horizontal, 12)
              .background(HotelColor.primaryBlue.color)
              .cornerRadius(6)
          }
        }
        if isFieldsVisible {
          FloatingLabelTextField(shouldShowError: tourist.shouldShowError, placeholder: "Имя", text: $tourist.firstName)
          FloatingLabelTextField(
            shouldShowError: tourist.shouldShowError,
            placeholder: "Фамилия",
            text: $tourist.lastName
          )

          NavigationLink(
            destination: CountryPickerView(
              selectedCountry: $tourist.citizenship,
              viewModel: CountryPickerViewModel()
            )
          ) {
            FloatingLabelTextField(
              shouldShowError: tourist.shouldShowError,
              placeholder: "Гражданство",
              text: $tourist.citizenship
            )
            .multilineTextAlignment(.leading)
            .disabled(true)
          }

          FloatingLabelTextField(
            shouldShowError: tourist.shouldShowError,
            placeholder: "Дата рождения",
            text: .constant(
              viewModel.getFormattedDate(from: tourist.birthDate)
            )
          )
          .disabled(true)
          .onTapGesture {
            isBirthDatePickerPresented = true
          }
          .sheet(isPresented: $isBirthDatePickerPresented) {

            VStack(alignment: .center) {
              DatePicker("Выберите дату", selection: Binding<Date>(get: {tourist.birthDate ?? Date()}, set: {tourist.birthDate = $0}), displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(210)])
          }

          FloatingLabelTextField(
            shouldShowError: tourist.shouldShowError,
            placeholder: "Номер загранпаспорта",
            text: $tourist.passportNumber
          )

          FloatingLabelTextField(
            shouldShowError: tourist.shouldShowError,
            placeholder: "Срок действия загранпаспорта",
            text: .constant(
              viewModel.getFormattedDate(from: tourist.passportExpiry)
            )
          )
          .disabled(true)
          .onTapGesture {
            isExpirationDatePickerPresented = true
          }
          .sheet(isPresented: $isExpirationDatePickerPresented) {

            VStack(alignment: .center) {
              DatePicker("Выберите дату", selection: Binding<Date>(get: {tourist.passportExpiry ?? Date()}, set: {tourist.passportExpiry = $0}), displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            }
            .presentationDragIndicator(.visible)
            .presentationDetents([.height(210)])
          }
        }
      }
    }
    .padding(16)
    .background(.white)
  }
}

#Preview {
  HotelSelectionCoordinatorView(startPage: .booking)
}
