//
//  Booking.swift
//  HotelApp
//
//  Created by Людмила Долонтаева on 2023-12-24.
//
import Foundation

struct HotelBooking: Codable, Identifiable {
  let id: Int
  let hotelName: String
  let hotelAdress: String
  let horating: Int
  let ratingName: String
  let departure: String
  let arrivalCountry: String
  let tourDateStart: String
  let tourDateStop: String
  let numberOfNights: Int
  let room: String
  let nutrition: String
  let tourPrice: Int
  let fuelCharge: Int
  let serviceCharge: Int
}
