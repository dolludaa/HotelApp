//
//  CustomerInfoViewViewModel.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-26.
//

import Foundation

@Observable
class CustomerInfoViewViewModel: CustomerInfoViewViewModelProtocol {

  func format(phone: String) -> String {
    var phone = phone

    if phone.starts(with: "+") {
      let removalCount = min(phone.count, 3)
      phone.removeFirst(removalCount)
    }

    let mask = Array("(***) ***-**-**")
    var phoneFigures = Array(phone.filter { $0.isNumber })
    var result = "+7 "

    for i in mask.indices where !phoneFigures.isEmpty {
      if mask[i] == "*" {
        result.append(phoneFigures.removeFirst())
      } else {
        result.append(mask[i])
      }
    }

    return result
  }

  func validateEmail(email: String) -> Bool {
    let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

    guard trimmedEmail.count < 255
    else { return false}

    let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
    let result = trimmedEmail.range(
      of: emailPattern,
      options: .regularExpression
    )

    return result != nil
  }
}
