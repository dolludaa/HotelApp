//
//  CountryPickerView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation
import SwiftUI

struct CountryPickerView: View {
  @Binding var selectedCountry: String
  @State var viewModel: CountryPickerViewModelProtocol
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    List(viewModel.countries, id: \.self) { country in
      Button {
        selectedCountry = country
        presentationMode.wrappedValue.dismiss()
      } label: {
        HStack {
          Text(country)
          Spacer()
          if country == selectedCountry {
            Image(systemName: "checkmark")
              .foregroundColor(.blue)
          }
        }
      }
    }
    .navigationBarTitle(Text("Выбор гражданства"), displayMode: .inline)
    .searchable(text: $selectedCountry)
    .task {
      viewModel.loadCountries()
    }
  }
}
