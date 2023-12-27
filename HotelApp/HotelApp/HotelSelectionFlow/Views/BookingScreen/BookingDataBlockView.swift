//
//  BookingDataBlockView.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//

import SwiftUI

struct BookingDataBlockView: View {

  let booking: HotelBooking

  private var pairs: [(key: String, value: String)] {
    [
      ("Вылет из", booking.departure),
      ("Страна, город", booking.arrivalCountry),
      ("Даты", "\(booking.tourDateStart) - \(booking.tourDateStop)"),
      ("Кол-во ночей", String(booking.numberOfNights)),
      ("Отель", booking.hotelName),
      ("Номер", booking.room),
      ("Питание", booking.nutrition)
    ]
  }

  var body: some View {
    ForEach(pairs, id: \.key) { pair in
      BookingRow(key: pair.key, value: pair.value)
        .padding(16)
    }
  }
}
